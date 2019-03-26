library(nparcomp)


### Name: nparcomp-package
### Title: Nparcomp: Nonparametric relative contrast effects.
### Aliases: nparcomp-package
### Keywords: package htest

### ** Examples


# two sample comparisons: Nonparametric Behrens-Fisher Problem

data(impla)
a<-npar.t.test(impla~group, data = impla,
               method = "t.app", 
               alternative = "two.sided")
summary(a)
plot(a)



#--Analysis of relative contrast effects in different contrast settings

data(liver)

 # Williams Contrast

a<-nparcomp(weight ~dosage, data=liver, asy.method = "probit",
 type = "Williams", alternative = "two.sided",
 plot.simci = TRUE, info = FALSE)
summary(a)


 # Dunnett dose 3 is baseline

c<-nparcomp(weight ~dosage, data=liver, asy.method = "probit",
 type = "Dunnett", control = "3",alternative = "two.sided",
 plot.simci = TRUE, info = FALSE)
summary(c)



data(colu)

  # Tukey comparison - one sided(lower)

a<-nparcomp(corpora~ dose, data=colu, asy.method = "mult.t",
 type = "Tukey",alternative = "less")
summary(a)
plot(a)

  # Tukey comparison- one sided(greater)

b<-nparcomp(corpora~ dose, data=colu, asy.method = "mult.t",
 type = "Tukey",alternative = "greater")
summary(b)
plot(b)




