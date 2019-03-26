library(spi)


### Name: spi
### Title: Standardized Precipitation Index (SPI)
### Aliases: spi
### Keywords: distribution

### ** Examples

##load data

data(spi_data) 

##write to file

write.table(spi_data,file="spi.txt",quote=FALSE,row.names=TRUE)	  

## Standard format with the output in the text format

spi(3,"spi.txt",1963,2010)

## A full output in graphical format

spi(7,"spi.txt",1963,2010,"Standardized Precipitation Index - Rio Grande do Norte State",1,"years","months")




