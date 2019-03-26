library(quantreg)


### Name: rearrange
### Title: Rearrangement
### Aliases: rearrange
### Keywords: regression

### ** Examples

data(engel)
z <- rq(foodexp ~ income, tau = -1,data =engel)
zp <- predict(z,newdata=list(income=quantile(engel$income,.03)),stepfun = TRUE)
plot(zp,do.points = FALSE, xlab = expression(tau),
        ylab = expression(Q ( tau )), main="Engel Food Expenditure Quantiles")
plot(rearrange(zp),do.points = FALSE, add=TRUE,col.h="red",col.v="red")
legend(.6,300,c("Before Rearrangement","After Rearrangement"),lty=1,col=c("black","red"))



