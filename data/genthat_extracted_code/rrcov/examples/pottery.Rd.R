library(rrcov)


### Name: pottery
### Title: Archaic Greek Pottery data
### Aliases: pottery pottery.test
### Keywords: datasets

### ** Examples


data(pottery)
x <- pottery[,c("MG", "CA")]
grp <- pottery$origin

##
## Compute robust location and covariance matrix and
## plot the tolerance ellipses
library(rrcov)
(mcd <- CovMcd(x))
col <- c(3,4)
gcol <- ifelse(grp == "Attic", col[1], col[2])
gpch <- ifelse(grp == "Attic", 16, 1)
plot(mcd, which="tolEllipsePlot", class=TRUE, col=gcol, pch=gpch)

##
## Perform classical LDA and plot the data, 0.975 tolerance ellipses
##  and LDA separation line
##
require(ellipse)
x <- pottery[,c("MG", "CA")]
grp <- pottery$origin
lda <- LdaClassic(x, grp)
lda
e1 <- ellipse(lda@cov, centre=lda@center[1,])
e2 <- ellipse(lda@cov, centre=lda@center[2,])

plot(CA~MG, data=pottery, col=gcol, pch=gpch,
    xlim=c(min(MG,e1[,1], e2[,1]), max(MG,e1[,1], e2[,1])),
    ylim=c(min(CA,e1[,2], e2[,2]), max(CA,e1[,2], e2[,2])))

ab <- lda@ldf[1,] - lda@ldf[2,]
cc <- lda@ldfconst[1] - lda@ldfconst[2]
abline(a=-cc/ab[2], b=-ab[1]/ab[2], col=2, lwd=2)

lines(e1, type="l", col=col[1])
lines(e2, type="l", col=col[2])

##
## Perform robust (MCD) LDA and plot data, classical and
##  robust separation line
##
require(ellipse)
plot(CA~MG, data=pottery, col=gcol, pch=gpch)
lda <- LdaClassic(x, grp)
ab <- lda@ldf[1,] - lda@ldf[2,]
cc <- lda@ldfconst[1] - lda@ldfconst[2]
abline(a=-cc/ab[2], b=-ab[1]/ab[2], col=2, lwd=2)
abline(a=-cc/ab[2], b=-ab[1]/ab[2], col=4, lwd=2)

rlda <- Linda(x, grp, method="mcd")
rlda
ab <- rlda@ldf[1,] - rlda@ldf[2,]
cc <- rlda@ldfconst[1] - rlda@ldfconst[2]
abline(a=-cc/ab[2], b=-ab[1]/ab[2], col=2, lwd=2)




