library(Publish)


### Name: glmSeries
### Title: Run a series of generalized linear regression analyses
### Aliases: glmSeries

### ** Examples


data(Diabetes)
Diabetes$hyper1 <- factor(1*(Diabetes$bp.1s>140))
## collect odds ratios from three univariate logistic regression analyses
uni.odds <- glmSeries(hyper1~1,vars=c("chol","hdl","location"),data=Diabetes,family=binomial)
uni.odds
## control the logistic regression analyses for age and gender
## but collect only information on the variables in `vars'.
controlled.odds <- glmSeries(hyper1~age+gender,
                             vars=c("chol","hdl","location"),
                             data=Diabetes, family=binomial)
controlled.odds



