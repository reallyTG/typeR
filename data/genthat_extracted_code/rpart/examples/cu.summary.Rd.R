library(rpart)


### Name: cu.summary
### Title: Automobile Data from 'Consumer Reports' 1990
### Aliases: cu.summary
### Keywords: datasets

### ** Examples

fit <- rpart(Price ~ Mileage + Type + Country, cu.summary)
par(xpd = TRUE)
plot(fit, compress = TRUE)
text(fit, use.n = TRUE)



