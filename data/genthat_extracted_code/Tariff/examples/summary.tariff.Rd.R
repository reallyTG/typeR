library(Tariff)


### Name: summary.tariff
### Title: Summary of the results obtained from Tariff algorithm
### Aliases: summary.tariff
### Keywords: Tariff

### ** Examples


## No test: 
data("RandomVA3")
test <- RandomVA3[1:200, ]
train <- RandomVA3[201:400, ]
allcauses <- unique(train$cause)
fit <- tariff(causes.train = "cause", symps.train = train, 
			symps.test = test, causes.table = allcauses)
correct <- which(fit$causes.test[,2] == test$cause)
accuracy <- length(correct) / dim(test)[1]
summary(fit)
summary(fit, top = 10)
summary(fit, id = "p849", top = 3)
## End(No test)




