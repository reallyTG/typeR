library(nparcomp)


### Name: summary.nparcomp
### Title: Summary of 'nparcomp'
### Aliases: summary.nparcomp
### Keywords: print

### ** Examples

data(liver)
a<-nparcomp(weight ~dosage, data=liver, asy.method = "probit", 
            type = "Williams", alternative = "two.sided", 
            plot.simci = FALSE, info = FALSE)
summary(a)



