library(Epi)


### Name: LCa.fit
### Title: Fit Lee-Carter-type models for rates to arbitrarily shaped
###   observations of rates in a Lexis diagram.
### Aliases: LCa.fit print.LCa summary.LCa plot.LCa predict.LCa
### Keywords: models regression

### ** Examples

library( Epi )
# Load the testis cancer data by Lexis triangles
data( testisDK )
tc <- subset( testisDK, A>14 & A<60 )
head( tc )

# We want to see rates per 100,000 PY
tc$Y <- tc$Y / 10^5

# Fit the Lee-Carter model with age-period interaction (default)
LCa.tc <- LCa.fit( tc, model="ACa", a.ref=30, p.ref=1980, quiet=FALSE, eps=10e-4, maxit=50 )

LCa.tc
summary( LCa.tc )

# Inspect what we got
names( LCa.tc )

# show the estimated effects
par( mfrow=c(1,3) )
plot( LCa.tc )

# Prediction data frame for ages 15 to 60 for two time points: 
nd <- data.frame( A=15:60 )
# LCa predictions
p70 <- predict.LCa( LCa.tc, newdata=cbind(nd,P=1970), sim=1000 )
p90 <- predict.LCa( LCa.tc, newdata=cbind(nd,P=1990), sim=1000 )

# Inspect the curves from the parametric bootstrap (simulation):
par( mfrow=c(1,1) )
head( cbind(p70,p90) )
matplot( nd$A, cbind(p70,p90), type="l", lwd=c(6,3,3), lty=c(1,3,3),
         col=rep( 2:3, each=3 ), log="y",
         ylab="Testis cancer incidence per 100,000 PY in 1970 resp. 1990", xlab="Age" )



