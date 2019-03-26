library(emulator)


### Name: optimal.scales
### Title: Use optimization techniques to find the optimal scales
### Aliases: optimal.scales optimal.scale
### Keywords: models

### ** Examples


##First, define some scales:
fish <- c(1,1,1,1,1,4)

## and a sigmasquared value:
REAL.SIGMASQ <- 0.3

## and a real relation:
real.relation <- function(x){sum( (1:6)*x )}

## Now a design matrix:
val  <- latin.hypercube(100,6)

## apply the real relation:
d <- apply(val,1,real.relation)

## and add some suitably correlated Gaussian noise:
A <- corr.matrix(val,scales=fish)
d.noisy <-  as.vector(rmvnorm(n=1,mean=apply(val,1,real.relation),REAL.SIGMASQ*A))

##  Now see if we can estimate the roughness lengths well.  Remember that
##  the true values are those held in vector "fish":
optimal.scales(val=val, scales.start=rep(1,6), d=d.noisy,
       method="SANN",control=list(trace=1000,maxit=3),
       give=FALSE)



# Now a test of optimal.scale(), where there is only a single roughness
#  scale to estimate.  This should be more straightforward:


df <- latin.hypercube(40,6)
fish2 <- rep(2,6)
A2 <- corr.matrix(df,scales=fish2)
d.noisy <- as.vector(rmvnorm(n=1, mean=apply(df,1,real.relation), sigma=A2))

jj.T <- optimal.scale(val=df,d=d.noisy,use.like=TRUE)
jj.F <- optimal.scale(val=df,d=d.noisy,use.like=FALSE)




