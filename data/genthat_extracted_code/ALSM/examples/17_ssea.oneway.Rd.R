library(ALSM)


### Name: ssea.oneway
### Title: Planning of Sample Sizes with Estimation Approach Single factor
###   ANOVA
### Aliases: ssea.oneway

### ** Examples

mc=matrix(c(1,-1,0,0,.5,.5,-.5,-.5,1/3,1/3,1/3,-1),byrow=TRUE,nrow = 3)
ssea.oneway(4,mc,sigma=2,n.weight=c(1,1,1,1),ci.width=c(2.61,1.85,2.14)*2,type='s')
#### page 761
mc=matrix( c(1,0,0,-1,0,1,0,-1,0,0,1,-1),byrow=TRUE,nrow = 3)
ssea.oneway(4,mc,2,n.weight=c(1,1,1,2),ci.width=c(1,1,1)*2,type='b',alpha=.1)

#### problem 17.25 page 772
mc=matrix(c(1,-1,0,0,0,0,
            .5,.5,-.5,-.5,0,0,
            0,0,1,-1,0,0,
            .25,.25,.25,.25,-.5,-.5),byrow=TRUE,nrow=4)
ssea.oneway(6,mc,.15,n.weight=rep(1,6),ci.width=rep(2*0.08,4),type='b',alpha=.05)




