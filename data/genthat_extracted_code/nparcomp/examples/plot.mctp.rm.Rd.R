library(nparcomp)


### Name: plot.mctp.rm
### Title: Visualizing the result of 'mctp.rm'
### Aliases: plot.mctp.rm
### Keywords: aplot

### ** Examples

data(panic)
a<-mctp.rm(CGI~week, data=panic, type = "Dunnett",
           alternative = "two.sided",
           asy.method =  "fisher", contrast.matrix = NULL)
plot(a)



