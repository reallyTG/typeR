library(semdiag)


### Name: semdiag
### Title: The 'semdiag' function
### Aliases: semdiag

### ** Examples

## Not run: 
##D ## Examples based on EQS
##D library(semdiag)
##D 
##D ## Example 1. Normally distributed data
##D data(N100)
##D 
##D ## Not run
##D ## The EQS input file is semplot.eqs
##D ## Model 1: treating prediction errors as factors
##D N100out.1<-semdiag(N100, 'semplot.eqs', D='F')
##D 
##D ## Diagnostics plot
##D semdiag.plot(N100out.1)
##D 
##D ## Summary output 
##D semdiag.summary(N100out.1)
##D 
##D ## Model 0: treating prediction errors the same as measurement errors
##D N100out.0<-semdiag(N100, 'semplot.eqs')
##D 
##D ## Diagnostics plot
##D semdiag.plot(N100out.0)
##D 
##D ## Summary output 
##D semdiag.summary(N100out.0)
##D 
##D ## Example 2. Contaminated data
##D data(N85)
##D 
##D ## The EQS input file is semplot.eqs
##D ## Model 1: treating prediction errors as factors
##D N85out.1<-semdiag(N85, 'semplot.eqs', D='F')
##D 
##D ## Diagnostics plot
##D semdiag.plot(N85out.1)
##D 
##D ## Summary output 
##D semdiag.summary(N85out.1)
##D 
##D ## Model 0: treating prediction errors the same as measurement errors
##D N85out.0<-semdiag(N85, 'semplot.eqs', D='E')
##D 
##D ## Diagnostics plot
##D semdiag.plot(N85out.0)
##D 
##D ## Summary output 
##D semdiag.summary(N85out.0)
##D 
##D ## Case profile plot
##D semdiag.cpp(N85out.0, cases=c(86, 90, 98:100))
##D 
##D ## Delete the 99th and 100th observations
##D N85out.1.del<-semdiag(N85, 'semplot.eqs', D='F', delete=c(99,100))
##D 
##D ## Examples based on the sem package
##D library(sem)
##D data(N100)
##D 
##D ## path diagram for the model
##D sem1<-specify.model()
##D f1 -> y1, NA, 1
##D f1 -> y2, l1, NA
##D f1 -> y3, l2, NA
##D f2 -> y4, NA, 1
##D f2 -> y5, l3, NA
##D f2 -> y6, l4, NA
##D f3 -> y7, NA, 1
##D f3 -> y8, l5, NA
##D f3 -> y9, l6, NA
##D f1 -> f2, g1, NA
##D f1 -> f3, g2, NA
##D f2 -> f3, g3, NA
##D y1 <-> y1, e1, NA
##D y2 <-> y2, e2, NA
##D y3 <-> y3, e3, NA
##D y4 <-> y4, e4, NA
##D y5 <-> y5, e5, NA
##D y6 <-> y6, e6, NA
##D y7 <-> y7, e7, NA
##D y8 <-> y8, e8, NA
##D y9 <-> y9, e9, NA
##D f1 <-> f1, e10, NA
##D f2 <-> f2, e11, NA
##D f3 <-> f3, e12, NA
##D 
##D ## Model 1: treating prediction errors as factors
##D N100out.1<-semdiag(N100, ram.path=sem1, software='sem', D='F')
##D 
##D ## Diagnostics plot
##D semdiag.plot(N100out.1)
##D 
##D ## Summary output 
##D semdiag.summary(N100out.1)
##D 
##D ## Model 0: treating prediction errors the same as measurement errors
##D N100out.0<-semdiag(N100, ram.path=sem1, software='sem')
##D 
##D ## Diagnostics plot
##D semdiag.plot(N100out.0)
##D 
##D ## Summary output 
##D semdiag.summary(N100out.0)
##D 
##D ## Example 2. Contaminated data
##D data(N85)
##D 
##D ## Model 1: treating prediction errors as factors
##D N85out.1<-semdiag(N85, ram.path=sem1, software='sem', D='F')
##D 
##D ## Diagnostics plot
##D semdiag.plot(N85out.1)
##D 
##D ## Summary output 
##D semdiag.summary(N85out.1)
##D 
##D ## Model 0: treating prediction errors the same as measurement errors
##D N85out.0<-semdiag(N85, ram.path=sem1, software='sem', D='E')
##D 
##D ## Diagnostics plot
##D semdiag.plot(N85out.0)
##D 
##D ## Summary output 
##D semdiag.summary(N85out.0)
##D 
##D ## Case profile plot
##D semdiag.cpp(N85out.0, cases=c(86, 90, 98:100))
##D 
##D ## Delete the 99th and 100th observations
##D N85out.1.del<-semdiag(N85, ram.path=sem1, software='sem', D='F', delete=c(99,100))
## End(Not run)




