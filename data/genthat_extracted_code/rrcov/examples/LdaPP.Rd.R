library(rrcov)


### Name: LdaPP
### Title: Robust Linear Discriminant Analysis by Projection Pursuit
### Aliases: LdaPP LdaPP.formula LdaPP.default
### Keywords: robust multivariate

### ** Examples


##
## Function to plot a LDA separation line
##
lda.line <- function(lda, ...)
{
    ab <- lda@ldf[1,] - lda@ldf[2,]
    cc <- lda@ldfconst[1] - lda@ldfconst[2]
    abline(a=-cc/ab[2], b=-ab[1]/ab[2],...)
}

data(pottery)
x <- pottery[,c("MG", "CA")]
grp <- pottery$origin
col <- c(3,4)
gcol <- ifelse(grp == "Attic", col[1], col[2])
gpch <- ifelse(grp == "Attic", 16, 1)

##
## Reproduce Fig. 2. from Pires and branco (2010)
##
plot(CA~MG, data=pottery, col=gcol, pch=gpch)

ppc <- LdaPP(x, grp, method="class", optim=TRUE)
lda.line(ppc, col=1, lwd=2, lty=1)

pph <- LdaPP(x, grp, method="huber",optim=TRUE)
lda.line(pph, col=3, lty=3)

pps <- LdaPP(x, grp, method="sest", optim=TRUE)
lda.line(pps, col=4, lty=4)

ppm <- LdaPP(x, grp, method="mad", optim=TRUE)
lda.line(ppm, col=5, lty=5)

rlda <- Linda(x, grp, method="mcd")
lda.line(rlda, col=6, lty=1)

fsa <- Linda(x, grp, method="fsa")
lda.line(fsa, col=8, lty=6)

## Use the formula interface:
##
LdaPP(origin~MG+CA, data=pottery)       ## use the same two predictors
LdaPP(origin~., data=pottery)           ## use all predictor variables

##
## Predict method
data(pottery)
fit <- LdaPP(origin~., data = pottery)
predict(fit)



