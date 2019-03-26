library(pscl)


### Name: RockTheVote
### Title: Voter turnout experiment, using Rock The Vote ads
### Aliases: RockTheVote
### Keywords: datasets

### ** Examples

data(RockTheVote)
## estimate MLEs of treatment effects
deltaFunction <- function(data){
  model <- glm(cbind(r,n-r)~treated,
               data=data,
               family=binomial)
  c(coef(model)[2],
    confint(model)[2,])
}


tmp <- by(RockTheVote,
          as.factor(RockTheVote$strata),
          deltaFunction)

tmp <- matrix(unlist(tmp),ncol=3,byrow=TRUE)

indx <- order(tmp[,1])

plot(y=1:40,
     x=tmp[indx,1],
     pch=16,cex=1.25,
     xlim=range(tmp),
     ylab="",
     axes=FALSE,
     xlab="Estimated Treatment Effect (MLEs, Logit Scale)")
text(y=1:40,
     x=par()$usr[1],
     pos=4,
     as.character((1:40)[indx]),
     cex=.5)
segments(x0=tmp[indx,2],
         x1=tmp[indx,3],
         y0=1:40,
         y1=1:40)
axis(1)
axis(3)
abline(v=0)



