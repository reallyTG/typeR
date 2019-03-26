library(coxphf)


### Name: coxphftest
### Title: Penalized Likelihood Ratio Test in Cox Regression
### Aliases: coxphftest
### Keywords: survival

### ** Examples

testdata <- data.frame(list(start=c(1, 2, 5, 2, 1, 7, 3, 4, 8, 8),
                stop =c(2, 3, 6, 7, 8, 9, 9, 9,14,17),
                event=c(1, 1, 1, 1, 1, 1, 1, 0, 0, 0),
                x1    =c(1, 0, 0, 1, 0, 1, 1, 1, 0, 0),
                x2    =c(0, 1, 1, 1, 0, 0, 1, 0, 1, 0),
                x3    =c(1, 0, 1, 0, 1, 0, 1, 0, 1, 0)))

summary( coxphf( formula=Surv(start, stop, event) ~ x1+x2+x3, data=testdata))

# testing H0: x1=0, x2=0

coxphftest( formula=Surv(start, stop, event) ~ x1+x2+x3, test=~x1+x2,  data=testdata)





