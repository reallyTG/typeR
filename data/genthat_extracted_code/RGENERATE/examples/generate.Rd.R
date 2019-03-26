library(RGENERATE)


### Name: generate
### Title: generate
### Aliases: generate generate.GPCAvarest2 generate.MonthlyList
###   generate.default generate.list generate.matrix generate.varest
###   generate.varest2

### ** Examples





library(RGENERATE)

set.seed(122)
NSTEP <- 1000
x <- rnorm(NSTEP)
y <- x+rnorm(NSTEP)
z <- c(rnorm(1),y[-1]+rnorm(NSTEP-1))
df <- data.frame(x=x,y=y,z=z)
var <- VAR(df,type="none")
gg <- generate(var,n=20) 

cov <- cov(gg)

ggg <- generate(FUN=rnorm,n=NSTEP,cov=cov)

 
library(RMAWGEN)
exogen <- as.data.frame(x+5)
gpcavar <- getVARmodel(data=df,suffix=NULL,p=3,n_GPCA_iteration=5,
n_GPCA_iteration_residuals=5,exogen=exogen)
gpcagg <- generate(gpcavar,n=20,exogen=exogen) 

## Generate an auto-regrassive time-series with a generic matrix 

A <- diag(c(1,-1,1))
mgg <- generate(A,n=100)

### Gap Filling Examples

 dfobs <- df
 dfobs[20:30,] <- NA 
 n <- nrow(df)
 dffill <- generate(gpcavar,n=n,exogen=exogen,gap.filling=dfobs,names=names(dfobs)) 
 
qqplot(dfobs$y,dffill$y)
abline(0,1)

### Gap filling with matrix 

mgg_n <- mgg
mgg_n[20:30,2] <- NA 

mgg_nfill <- generate(A,gap.filling=mgg_n)

print(mgg_n[1:31,])
print(mgg_nfill[1:31,])

dfobs2 <- df
dfobs2[20:30,2] <- NA
n <- nrow(df)
dffill2 <- generate(gpcavar,n=n,exogen=exogen,gap.filling=dfobs2,names=names(dfobs2)) 

qqplot(dfobs$y,dffill$y)
abline(0,1)
 
### generation with 'generetion.matrix' 
### and matrix 'x' is a covariance matrix 

covariance <- array(0.5,c(3,3))

diag(covariance) <- 1

set.seed(127)
ngns <- 1000
gg1 <- generate(FUN=rnorm,n=ngns,cov=covariance)
set.seed(127)
gg2 <- generate(covariance,type="covariance",n=ngns)


## generate with a list of covariance matrix 
ndim <- 5
dim <- c(ndim,ndim)
CS1 <- array(0.3,dim)
CS2 <- array(0.5,dim)
CS3 <- array(0.7,dim)
CS4 <- array(0.1,dim)

diag(CS1) <- 1
diag(CS2) <- 1
diag(CS3) <- 1
diag(CS4) <- 1

list <- list(CS1=CS1,CS2=CS2,CS3=CS3,CS4=CS4)

series <- rep(1:4,times=4,each=100)
series <- sprintf("CS%d",series)
names_A <- sprintf("A%d",1:ndim)
ggs <- generate(list,factor.series=series,FUN=rnorm,type="covariance",names=names_A)

ggs_CS1 <- ggs[series=="CS1",]
cov(ggs_CS1)

ggs_CS3 <- ggs[series=="CS3",] 
cov(ggs_CS3)



