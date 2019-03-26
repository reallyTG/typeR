library(MicroDatosEs)


### Name: defun2011
### Title: Reads microdata for deaths as provided by the INE
### Aliases: defun2011
### Keywords: manip

### ** Examples

# This command reads a few lines sampled from the 2010 deaths microdata file
x <- defun2011(system.file("extdata", 
               "sampleDEFUN2010.txt", 
               package = "MicroDatosEs"))
summary(x)



