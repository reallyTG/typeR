library(PoweR)


### Name: many.crit
### Title: Computation of critical values for several test statistics
### Aliases: many.crit
### Keywords: univar

### ** Examples

critval <- many.crit(law.index=2,stat.indices=c(10,15),M=10^3,vectn=c(20,50,100),
                     level=c(0.05,0.1),alter=list(stat10=3,stat15=3),law.pars=NULL,
                     parstats=NULL)
print(critval,digits=3,latex.output=FALSE)



