library(hcci)


### Name: HC
### Title: Covariance Matrix - (HC0, HC2, HC3, HC4 and HC5)
### Aliases: HC
### Keywords: heteroskedasticity covariance

### ** Examples

data(schools)
datas = schools[-50,]
y = datas$Expenditure 
x = datas$Income/10000
model = lm(y ~ x)
HC(model, method=4)



