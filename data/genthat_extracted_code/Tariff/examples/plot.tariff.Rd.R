library(Tariff)


### Name: plot.tariff
### Title: Plot CSMF of the results obtained from Tariff algorithm
### Aliases: plot.tariff

### ** Examples


## No test: 
data("RandomVA3")
test <- RandomVA3[1:200, ]
train <- RandomVA3[201:400, ]
allcauses <- unique(train$cause)
fit <- tariff(causes.train = "cause", symps.train = train, 
				symps.test = test, causes.table = allcauses)
plot(fit, top = 10, main = "Top 5 population COD distribution")
plot(fit, min.prob = 0.05, main = "Ppulation COD distribution (at least 5%)")
## End(No test)



