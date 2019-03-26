library(Tariff)


### Name: tariff
### Title: Replicate Tariff methods
### Aliases: tariff
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
## End(No test)



