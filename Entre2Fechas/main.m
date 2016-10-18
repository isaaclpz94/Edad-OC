//
//  main.m
//  Entre2Fechas
//
//  Created by Isaac Mac on 15/9/16.
//  Copyright (c) 2016 Isaac Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Cogemos la fecha pasada por parámetro
        const char *fechaC = argv[1];
        
        //La pasamos a NSString
        NSString *fechaS = [NSString stringWithCString:fechaC encoding:NSUTF8StringEncoding];
        
        //Creamos el formato de la fecha
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
        [formater setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]]; //añadir esta línea para que no reste un día por problemas en la zona horaria
        [formater setDateFormat:@"yyyy-MM-dd"];
        
        //Creamos la fecha en NSDate a partir del NSString
        NSDate *fecha = [[NSDate alloc] init];
        fecha = [formater dateFromString:fechaS];
        
        //Fecha actual
        NSDate *fechaActual = [NSDate date];
        
        NSLog(@"Fecha de inicio: %@. Fecha actual: %@", fecha, fechaActual);
        
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:fecha toDate:fechaActual options:0];
        
        NSLog(@"Días que han pasado: %ld", [components day]);
    }
    return 0;
}
