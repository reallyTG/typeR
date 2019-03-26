library(nparcomp)


### Name: plot.mctp
### Title: Visualizing the result of 'mctp'
### Aliases: plot.mctp
### Keywords: aplot

### ** Examples

data(liver)
a<-mctp(weight ~dosage, data=liver, asy.method = "fisher",
        type = "Dunnett", alternative = "two.sided", plot.simci = FALSE, 
        info = FALSE)
plot(a)



