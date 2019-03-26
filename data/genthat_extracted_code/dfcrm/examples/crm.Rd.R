library(dfcrm)


### Name: crm
### Title: Executing the CRM
### Aliases: crm plot.mtd print.mtd crmh crmhlgt lcrm lcrmlgt myjitter
### Keywords: datasets

### ** Examples


# Create a simple data set
prior <- c(0.05, 0.10, 0.20, 0.35, 0.50, 0.70)
target <- 0.2
level <- c(3, 4, 4, 3, 3, 4, 3, 2, 2, 2)
y <- c(0, 0, 1, 0, 0, 1, 1, 0, 0, 0)
foo <- crm(prior, target, y, level)
ptox <- foo$ptox  # updated estimates of toxicity rates




