library(lbreg)


### Name: lbreg
### Title: Log-Binomial regression
### Aliases: lbreg

### ** Examples

require(lbreg)

# data preparation
data(PCS)  # ungrouped data
w <- PCS
w <- w[,-1]
w$race <- factor(w$race)
w$dpros <- factor(w$dpros)
w$dcaps <- factor(w$dcaps)

# log-binomial regression
fm <- lbreg(tumor ~ ., data=w)
fm
coef(fm)
summary(fm)


# grouped data
require(lbreg)
data(Caesarian)
m1 <- lbreg( cbind(n1, n0) ~ RISK + NPLAN + ANTIB, data=Caesarian)
summary(m1)

# dispersion estimate based on deviance residuals
sum(m1$dev.res^2)  
# dispersion estimate based on Pearson residuals (reported in the summary above)
sum(m1$residuals^2)/(8-4)  

predict(m1, newdata=data.frame(RISK=0, NPLAN=1, ANTIB=1))

# m0 <- glm( cbind(n1, n0) ~ RISK + NPLAN + ANTIB, data=Dat, family=binomial(link='log'))
# summary(m0)





