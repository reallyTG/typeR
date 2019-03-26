library(nparcomp)


### Name: plot.nparcomp
### Title: Visualizing the result of 'nparcomp'
### Aliases: plot.nparcomp
### Keywords: aplot

### ** Examples

data(liver)
a<-nparcomp(weight ~dosage, data=liver, asy.method = "probit", 
            type = "Williams", alternative = "two.sided", 
            plot.simci = FALSE, info = FALSE)
plot(a)



