library(coxsei)


### Name: coxseisim
### Title: A function to simulate a CoxSEI process conditional on specified
###   covariate values
### Aliases: coxseisim
### Keywords: ~datagen ~survival

### ** Examples

    n.smp <- 100;
    z <- matrix(NA,n.smp,3)
    for(i in 1:n.smp)
    z[i,] <- round(c(runif(1,0.5,1.5),runif(1,1.5,2.5),rbinom(1,1,0.5)),2)
    dat <- coxseisim(1:3*0.2,c(0.07,10),censor=rlnorm(1,0,0.1),m=2,
    Z=function(x)matrix(z[1,],length(x),3,byrow=TRUE))
    dat$id <- 1;
    for(i in 2:n.smp){
      dattmp <- coxseisim(1:3*0.2,c(0.07,10),censor=rlnorm(1,0,0.1),m=2,
      Z=function(x)matrix(z[i,],length(x),3,byrow=TRUE))
      dattmp$id <- i;
      dat <- rbind(dat,dattmp)
    }




