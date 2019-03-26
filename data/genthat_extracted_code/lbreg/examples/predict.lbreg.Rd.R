library(lbreg)


### Name: predict.lbreg
### Title: Predict method for Log-Binomial regression.
### Aliases: predict.lbreg

### ** Examples

require(lbreg)

# data preparation
data(PCS)
w <- PCS
w <- w[,-1]
w$race <- factor(w$race)
w$dpros <- factor(w$dpros)
w$dcaps <- factor(w$dcaps)

# log-binomial regression
fm <- lbreg(tumor ~ ., data=w)
novo <- data.frame(age=c(41, 32), race=c(1,2), dpros=c(2,4), 
                   dcaps=c(1,1), psa=c(7.24,3.25), vol=c(4.3,5.6), 
                   gleason=c(2,8))
predict(fm, newdata=novo)



