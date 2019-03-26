library(itree)


### Name: cu.summary
### Title: Automobile Data from 'Consumer Reports' 1990
### Aliases: cu.summary
### Keywords: datasets

### ** Examples

#same example as in rpart:
fit <- itree(Price ~ Mileage + Type + Country, cu.summary)
plot(fit, compress=TRUE)
text(fit, use.n=TRUE)



