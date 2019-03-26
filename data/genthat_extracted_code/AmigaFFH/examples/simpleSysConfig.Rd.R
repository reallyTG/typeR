library(AmigaFFH)


### Name: simpleSysConfig
### Title: Function to generate a simple Amiga system-configuration
###   representation
### Aliases: simpleSysConfig

### ** Examples

## Not run: 
##D ## Create a simple system-configuration (S3 SysConfigClass)
##D sc <- simpleSysConfig
##D 
##D ## And modify it as you wish.
##D ## in this case change the setting for the printer
##D ## from the parallel port to the serial port:
##D sc$PrinterPort <- factor("SERIAL_PRINTER", levels(sc$PrinterPort))
## End(Not run)



