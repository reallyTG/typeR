library(hcci)


### Name: Pboot
### Title: Percentile Bootstrap Confidence Interval (Wild Bootstrap) -
###   Linear Models Heteroskedasticity
### Aliases: Pboot
### Keywords: bootstrap heteroscedasticity

### ** Examples

data(schools)
datas = schools[-50,]
y = datas$Expenditure 
x = datas$Income/10000
model = lm(y ~ x)
Pboot(model=model, significance = 0.05, double = FALSE,
      J=1000, K = 100, distribution = "rademacher")



