library(popbio)


### Name: stretchbetaval
### Title: Generate stretched beta-distributed random numbers
### Aliases: stretchbetaval
### Keywords: survey

### ** Examples

stretchbetaval(3, 1.2, 1, 20, runif(1))

 # Generates stretchbeta random
 # fertilities for a population of 1000 mature individuals (Ni) with mean
 # fertility (f) of 3.0 and inter-individual variance in fertility (varF) of 1.5.
 
 Ni   <- 1000
 f    <-    2.5
 varF <-    1
 fmin <- 1
 fmax <- 5
 rndfert<-numeric(Ni) 
for(i in 1:Ni)
{
   rndfert[i]  <- stretchbetaval(f, sqrt(varF), fmin, fmax, runif(1)) 
}
 hist(rndfert,20, main="Stretched beta-distributed random fertilities", 
xlab="Fertility rate", , col="blue") 



