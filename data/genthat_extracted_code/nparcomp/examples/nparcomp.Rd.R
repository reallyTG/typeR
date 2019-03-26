library(nparcomp)


### Name: nparcomp
### Title: Nonparametric relative contrast effects
### Aliases: nparcomp
### Keywords: htest

### ** Examples


data(liver)

  # Williams Contrast

a<-nparcomp(weight ~dosage, data=liver, asy.method = "probit",
            type = "Williams", alternative = "two.sided", 
            plot.simci = TRUE, info = FALSE,correlation=TRUE)
summary(a)



 # Dunnett dose 3 is baseline

c<-nparcomp(weight ~dosage, data=liver, asy.method = "probit",
            type = "Dunnett", control = "3",
            alternative = "two.sided", info = FALSE)
summary(c)
plot(c)


data(colu)

  # Tukey comparison- one sided(lower)

a<-nparcomp(corpora~ dose, data=colu, asy.method = "mult.t",
            type = "Tukey",alternative = "less", 
            plot.simci = TRUE, info = FALSE)
summary(a)


 # Tukey comparison- one sided(greater)

b<-nparcomp(corpora~ dose, data=colu, asy.method = "mult.t",
            type = "Tukey",alternative = "greater", 
            plot.simci = TRUE, info = FALSE)
summary(b)





