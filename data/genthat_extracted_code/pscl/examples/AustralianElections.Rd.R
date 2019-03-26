library(pscl)


### Name: AustralianElections
### Title: elections to Australian House of Representatives, 1949-2016
### Aliases: AustralianElections
### Keywords: datasets

### ** Examples

data(AustralianElections)
attach(AustralianElections)
alpSeatShare <- ALPSeats/Seats
alpVoteShare <- ALP2PP/100

## log-odds transforms
x <- log(alpVoteShare/(1-alpVoteShare))
y <- log(alpSeatShare/(1-alpSeatShare))

ols <- lm(y~x)   ## Tufte-style seats-votes regression

xseq <- seq(-4.5,4.5,length=500)
yhat <- coef(ols)[1] + coef(ols)[2]*xseq
yhat <- exp(yhat)/(1+exp(yhat))
xseq <- exp(xseq)/(1+exp(xseq))

## seats vote curve
plot(x=alpVoteShare,
     y=alpSeatShare,
     xlab="ALP Vote Share",
     ylab="ALP Seat Share")
lines(xseq,yhat,lwd=2)
abline(h=.5,lty=2)
abline(v=.5,lty=2)



