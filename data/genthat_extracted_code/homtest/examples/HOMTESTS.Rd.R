library(homtest)


### Name: HOMTESTS
### Title: Homogeneity tests
### Aliases: HOMTESTS ADbootstrap.test HW.tests DK.test
### Keywords: htest

### ** Examples

data(annualflows)
annualflows[1:10,]
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
split(x2,cod2)
sapply(split(x2,cod2),Lmoments)
regionalLmoments(x2,cod2)

ADbootstrap.test(x2,cod2)
ADbootstrap.test(x2,cod2,index=1)
HW.tests(x2,cod2)
DK.test(x2,cod2)



