library(Epi)


### Name: DMepi
### Title: Epidmiological rates for diabetes in Denmark 1996-2015
### Aliases: DMepi
### Keywords: datasets

### ** Examples

data(DMepi)
# Total deaths and person-years in the Danish population
ftable( addmargins( xtabs( cbind( Deaths=D.nD+D.DM,
                                    PYrs=Y.nD+Y.DM ) ~ P + sex,
                           data=DMepi ),
                    2 ),
        row.vars = 1 )
# Deaths and person-years in the population of diabetes patients
round(
ftable( addmargins( xtabs( cbind( Deaths=D.DM,
                                    PYrs=Y.DM ) ~ P + sex,
                           data=DMepi ),
                    2 ),
        row.vars = 1 ) )

# Model for age-specific incidence rates;
inc <- glm( X ~ sex + Ns( A, knots=seq(30,80,10) ) + P,
                offset = log(Y.nD),
                family = poisson,
                  data = DMepi )

# Predict for men and women separately in 2010:
ndm <- data.frame( sex="M", A=20:90, P=2010, Y.nD=1000 )
ndf <- data.frame( sex="F", A=20:90, P=2010, Y.nD=1000 )
prM <- ci.pred( inc, ndm )
prF <- ci.pred( inc, ndf )
matplot( ndm$A, cbind(prM,prF),
         type="l", lty=1, lwd=c(3,1,1),
         col=rep(c("blue","red"),each=3),
         log="y", xlab="Age", ylab="DM incidence per 1000 PY" )

# This is a proportional hazards model - add sex-age interaction
int <- update( inc, . ~ . + sex:Ns( A, knots=seq(30,80,10) ) )
prM <- ci.pred( int, ndm )
prF <- ci.pred( int, ndf )
matplot( ndm$A, cbind(prM,prF),
         type="l", lty=1, lwd=c(3,1,1),
         col=rep(c("blue","red"),each=3),
         log="y", xlab="Age", ylab="DM incidence per 1000 PY" )

# The rate-ratio is teased out using the ci.exp:
RRp <- ci.exp( inc, list(ndm,ndf) )
RRi <- ci.exp( int, list(ndm,ndf) )

# and added to the plot
matlines( ndm$A, cbind(RRi,RRp),
          type="l", lty=1, lwd=c(3,1,1), col=gray(rep(c(0.3,0.7),each=3)) )
abline(h=1)
axis(side=4)
mtext( "Male/Female IRR", side=4, line=2 )



