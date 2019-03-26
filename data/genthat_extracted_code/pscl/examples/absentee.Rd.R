library(pscl)


### Name: absentee
### Title: Absentee and Machine Ballots in Pennsylvania State Senate Races
### Aliases: absentee
### Keywords: datasets

### ** Examples

data(absentee)
summary(absentee)

denom <- absentee$absdem + absentee$absrep
y <- (absentee$absdem - absentee$absrep)/denom * 100
denom <- absentee$machdem + absentee$machrep
x <- (absentee$machdem - absentee$machrep)/denom *100

ols <- lm(y ~ x,
          subset=c(rep(TRUE,21),FALSE)  ## drop data point 22
          )

## predictions for disputed absentee point
yhat22 <- predict(ols,
                  newdata=list(x=x[22]),
                  se.fit=TRUE,
                  interval="prediction")
tstat <- (y[22]-yhat22$fit[,"fit"])/yhat22$se.fit
cat("tstat on actual outcome for obs 22:",tstat,"\n")
cat(paste("Pr(t>",round(tstat,2),") i.e., one-sided:\n",sep=""))
cat(1-pt(tstat,df=yhat22$df),"\n")

## make a picture
xseq <- seq(min(x)-.1*diff(range(x)),
            max(x)+.1*diff(range(x)),
            length=100)
yhat <- predict(ols,interval="prediction",
                newdata=list(x=xseq))
plot(y~x,
     type="n",
     axes=FALSE,
     ylim=range(yhat,y),
     xlim=range(xseq),xaxs="i",
     xlab="Democratic Margin, Machine Ballots (Percentage Points)",
     ylab="Democratic Margin, Absentee Ballots (Percentage Points)")
polygon(x=c(xseq,rev(xseq)),  ## overlay 95% prediction CI
        y=c(yhat[,"lwr"],rev(yhat[,"upr"])),
        border=FALSE,
        col=gray(.85))
abline(ols,lwd=2)           ## overlay ols
points(x[-22],y[-22],pch=1) ## data
points(x[22],y[22],pch=16)  ## disputed data point

text(x[22],y[22],
     "Disputed\nElection",
     cex=.75,
     adj=1.25)
axis(1)
axis(2)




