library(BMA)


### Name: MC3.REG
### Title: Bayesian simultaneous variable selection and outlier
###   identification
### Aliases: MC3.REG as.data.frame.mc3 [.mc3
### Keywords: regression models

### ** Examples


## Not run: 
##D # Example 1:   Scottish hill racing data.
##D 
##D data(race)
##D b<- out.ltsreg(race[,-1], race[,1], 2)
##D races.run1<-MC3.REG(race[,1], race[,-1], num.its=20000, c(FALSE,TRUE), 
##D                     rep(TRUE,length(b)), b, PI = .1, K = 7, nu = .2, 
##D                     lambda = .1684, phi = 9.2)
##D races.run1
##D summary(races.run1)
## End(Not run)

# Example 2: Crime data
library(MASS)
data(UScrime)

y.crime.log<- log(UScrime$y)
x.crime.log<- UScrime[,-ncol(UScrime)]
x.crime.log[,-2]<- log(x.crime.log[,-2])
crime.run1<-MC3.REG(y.crime.log, x.crime.log, num.its=2000, 
                     rep(TRUE,15), outliers = FALSE)
crime.run1[1:25,]
summary(crime.run1)







