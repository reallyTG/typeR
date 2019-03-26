library(nparcomp)


### Name: mctp.rm
### Title: MCTP and SCIs in a repeated measures design (one group)
### Aliases: mctp.rm
### Keywords: htest

### ** Examples

data(panic)
a<-mctp.rm(CGI~week, data=panic, type = "Dunnett",
           alternative = "two.sided",
           asy.method = "mult.t", plot.simci = FALSE,
           info = FALSE, contrast.matrix = NULL)
summary(a)
plot(a)

mctp.rm(CGI~week, data=panic, type = "Tukey",
        alternative = "two.sided",
        asy.method = "mult.t", plot.simci = TRUE)



