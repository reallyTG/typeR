library(nsRFA)


### Name: HOMTESTS
### Title: Homogeneity tests
### Aliases: HOMTESTS ADbootstrap.test HW.tests DK.test discordancy
###   criticalD
### Keywords: htest

### ** Examples

data(hydroSIMN)
annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]
split(x,cod)

#ADbootstrap.test(x,cod,Nsim=100)   # it takes some time
#HW.tests(x,cod)                    # it takes some time
DK.test(x,cod)

fac <- factor(annualflows["cod"][,],levels=c(34:38))
x2 <- annualflows[!is.na(fac),"dato"]
cod2 <- annualflows[!is.na(fac),"cod"]

ADbootstrap.test(x2,cod2,Nsim=100)
ADbootstrap.test(x2,cod2,index=1,Nsim=200)
HW.tests(x2,cod2,Nsim=100)
DK.test(x2,cod2)

discordancy(x,cod)

criticalD()



