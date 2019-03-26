library(mknapsack)


### Name: mknapsack
### Title: Optimal packing into multiple containers
### Aliases: mknapsack

### ** Examples


# Calculate the optimal containers summary for a sample dataset
data(unitsbro)
library(data.table)
units.combined <- data.table(unitsbro)
moq <- units.combined$moq
profit <- units.combined$utility
volume <- units.combined$volume
res <- mknapsack(profit, volume, moq, 65)
units.combined$container <- as.factor(res)
#Aggregate solution to container
containers <- units.combined[order(container), .(volume = sum(volume),
profit = sum(profit)), by = container]




