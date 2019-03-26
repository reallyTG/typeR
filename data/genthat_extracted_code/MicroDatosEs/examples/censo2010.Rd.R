library(MicroDatosEs)


### Name: censo2010
### Title: Reads microdata for the 2010 decennial census provided by the
###   INE
### Aliases: censo2010
### Keywords: manip

### ** Examples

## The first 1000 lines from the census file are provided within the package
c.file <- system.file("extdata", "sampleCenso2010.txt", 
                      package = "MicroDatosEs")
res <- censo2010(c.file)
summary(res)



