library(ebal)


### Name: ebalance
### Title: Entropy balancing
### Aliases: ebalance

### ** Examples


# create toy data: treatment indicator and three covariates X1-3
treatment   <- c(rep(0,50),rep(1,30))
X           <- rbind(replicate(3,rnorm(50,0)),replicate(3,rnorm(30,.5)))
colnames(X) <- paste("x",1:3,sep="")

# entropy balancing
eb.out <- ebalance(Treatment=treatment,
                   X=X)
# means in treatment group data
apply(X[treatment==1,],2,mean)
# means in reweighted control group data
apply(X[treatment==0,],2,weighted.mean,w=eb.out$w)
# means in raw data control group data
apply(X[treatment==0,],2,mean)



