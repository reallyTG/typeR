library(AutoSEARCH)


### Name: AutoSEARCH-package
### Title: General-to-Specific (GETS) Modelling
### Aliases: AutoSEARCH-package AutoSEARCH

### ** Examples

#Generate from AR(1) model:
set.seed(123)
y <- arima.sim(list(ar=0.4), 200)

#Estimate AR(2) with intercept as mean specification
#and log-ARCH(4) as log-volatility specification:
sm(y, mc=TRUE, ar=1:2, arch=1:4)

#General-to-Specific model selection of the mean:
mymodel <- gets.mean(y, mc=TRUE, ar=1:2, arch=1:4)

#General-to-Specific model selection of the
#simplified mean specification:
gets.vol(mymodel$resids, arch=1:4)



