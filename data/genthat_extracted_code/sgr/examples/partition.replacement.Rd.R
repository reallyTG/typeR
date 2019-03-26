library(sgr)


### Name: partition.replacement
### Title: Internal function.
### Aliases: partition.replacement
### Keywords: utility

### ** Examples

require(MASS)
set.seed(20130207)
R <- matrix(c(1,.3,.3,1),2,2)
Dx <- rdatagen(n=20,R=R,Q=5)$data

## partition matrix
PM <- matrix(0,nrow(Dx),ncol(Dx))
PM[3:10,2] <- 1
PM[3:10,1] <- 1
partition.replacement(Dx,PM) # warning! zero replacements

## using fake.model
partition.replacement(Dx,PM,fake.model="uninformative",p=matrix(c(.3,.2),ncol=2))

###
p <- c(.5,0)
gam <- c(1,1)
del <- c(1,1)
Pparm <- list(p=p,gam=gam,del=del)
partition.replacement(Dx,PM,Pparm=Pparm) 

### another partition
PM[11:15,2] <- 2
(Pparm <- list(p=matrix(c(0,.5,.5,0),2,2),
      gam=matrix(c(1,4,1,4),2,2),del=matrix(c(1,2,1,2),2,2)))
partition.replacement(Dx,PM,Pparm=Pparm) 





