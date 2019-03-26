library(nparcomp)


### Name: summary.mctp
### Title: Summary of 'mctp'
### Aliases: summary.mctp
### Keywords: print

### ** Examples

data(liver)
a<-mctp(weight ~dosage, data=liver, asy.method = "fisher",
        type = "Dunnett", alternative = "two.sided", plot.simci = FALSE, 
        info = FALSE)
summary(a)



