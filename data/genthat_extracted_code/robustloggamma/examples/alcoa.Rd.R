library(robustloggamma)


### Name: alcoa
### Title: Quality assurance measurement on aluminium.
### Aliases: alcoa
### Keywords: datasets

### ** Examples

data(alcoa)
par(mfcol=c(1,2))
boxplot(I(log(alcoa$ratio))~alcoa$label)
boxplot(I(log(alcoa$dist))~alcoa$label)



