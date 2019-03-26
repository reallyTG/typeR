library(hcci)


### Name: Tboot
### Title: Bootstrap-t Confidence Interval (Wild Bootstrap) - Linear Models
###   Heteroskedasticity
### Aliases: Tboot
### Keywords: bootstrap heteroscedasticity

### ** Examples

data(schools)
datas = schools[-50,]
y = datas$Expenditure 
x = datas$Income/10000
model = lm(y ~ x)
Tboot(model=model, significance = 0.05, hc = 4, double = FALSE,
      J=1000, K = 100, distribution = "rademacher")



