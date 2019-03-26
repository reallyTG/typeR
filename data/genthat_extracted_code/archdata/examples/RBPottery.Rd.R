library(archdata)


### Name: RBPottery
### Title: Romano-British Pottery
### Aliases: RBPottery
### Keywords: datasets

### ** Examples

data(RBPottery)
print(aggregate(RBPottery[, -c(1:3)], list(Region=RBPottery$Region), mean), digits=2)
plot(Na2O~CaO, RBPottery, pch=as.numeric(Region)-1)
legend("topright", levels(RBPottery$Region), title="Region", pch=0:2)



