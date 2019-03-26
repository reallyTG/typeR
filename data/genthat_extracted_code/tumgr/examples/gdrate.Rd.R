library(tumgr)


### Name: gdrate
### Title: Tumor Growth Rate Analysis
### Aliases: gdrate
### Keywords: analysis models datagen

### ** Examples


# example data
data(sampleData)

# generate plots and results
par(mfrow=c(3, 2))
out <- gdrate(sampleData, 0.05, TRUE)
par(mfrow=c(1, 1))

# summary of cases
out$models

# descriptive statistics
out$sumstats

# plot g and d distributions
res <- out$results
par(mfrow=c(2,1))
hist(res$g, col='blue', main=paste('Median g=', round(median(na.omit(res$g)), digits=6)), xlab="g")
hist(res$d, col='blue', main=paste('Median d=', round(median(na.omit(res$d)), digits=6)), xlab="d")
par(mfrow=c(1,1))




