library(gamlss)


### Name: quantSheets
### Title: Quantile Sheets
### Aliases: quantSheets quantSheets.control findPower z.scoresQS
### Keywords: regression

### ** Examples

data(abdom)
m1 <- quantSheets(y,x, data=abdom)
head(fitted(m1))
p1 <- predict(m1, newdata=c(20,30,40))
matpoints(c(20,30,40), p1)
z.scoresQS(m1,y=c(150, 300),x=c(20, 30) )
# If we needed a power transformation not appropriate for this data
findPower(y,x, data=abdom)



