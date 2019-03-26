library(MicroDatosEs)


### Name: epf.2011.hogares
### Title: Functions to read the Spanish survey of family budgets (EPF)
###   microdata provided by the INE.
### Aliases: epf.2011.hogares epf.2011.gastos epf.2011.miembros
### Keywords: manip

### ** Examples

# This command reads a few lines sampled from 
# the households EPF file for 2011
x<- epf.2011.hogares(system.file("extdata",
                                 "sample_hogares_a2011.txt",
                                 package = "MicroDatosEs") )
summary(x)



