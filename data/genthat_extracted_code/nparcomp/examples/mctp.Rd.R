library(nparcomp)


### Name: mctp
### Title: Nonparam. multiple contrast tests and simult. confidence
###   intervals
### Aliases: mctp
### Keywords: htest

### ** Examples


data(liver)

  # Williams Contrast

a<-mctp(weight ~dosage, data=liver, asy.method = "fisher",
        type = "Williams", alternative = "two.sided", 
        plot.simci = TRUE, info = FALSE)
summary(a)

 # Dunnett Contrast

b<-mctp(weight ~dosage, data=liver, asy.method = "fisher",
        type = "Dunnett", alternative = "two.sided", 
        plot.simci = TRUE, info = FALSE)
summary(b)

 # Dunnett dose 3 is baseline

c<-mctp(weight ~dosage, data=liver, asy.method = "fisher",
        type = "Dunnett", control = "3",alternative = "two.sided",
        plot.simci = TRUE, info = FALSE)
summary(c)


data(colu)

  # Tukey comparison- one sided(less)

a<-mctp(corpora~ dose, data=colu, asy.method = "mult.t",
        type = "Tukey",alternative = "less", 
        plot.simci = TRUE, info = FALSE)
summary(a)

 # Tukey comparison- one sided(greater)

b<-mctp(corpora~ dose, data=colu, asy.method = "mult.t",
        type = "Tukey",alternative = "greater", 
        plot.simci = TRUE, info = FALSE)
summary(b)

  # Tukey comparison- one sided(less)

c<-mctp(corpora~ dose, data=colu, asy.method = "mult.t",
        type = "Tukey",alternative = "less", 
        plot.simci = TRUE, info = FALSE)
summary(c)

 # Marcus comparison- one sided(greater)

d<-mctp(corpora~ dose, data=colu, asy.method = "fisher",
        type = "Marcus",alternative = "greater", 
        plot.simci = TRUE, info = FALSE)
summary(d)



