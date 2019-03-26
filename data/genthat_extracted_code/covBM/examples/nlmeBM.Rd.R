library(covBM)


### Name: nlmeBM
### Title: nlmeBM
### Aliases: nlmeBM

### ** Examples

data(Milk, package="nlme")
Model_fit<- nlmeBM(protein ~ SSasymp(Time, Asym, R0, lrc), data=Milk,
				fixed = Asym + R0 + lrc ~ 1, random = Asym ~ 1|Cow,
				covariance=covFracBM(form=~Time|Cow),
        		start = c(Asym = 3.5, R0 = 4, lrc = -1))



