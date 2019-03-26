## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# library("devtools")
# install_github('cgaillac/RationalExp')

## ------------------------------------------------------------------------
#install.packages("personal_directory/RationalExp_1.1.tar.gz", repos=NULL)

## ------------------------------------------------------------------------
library(RationalExp)

## ------------------------------------------------------------------------
rm(list=ls())
### load packages
library(snowfall)
library(RationalExp)
set.seed(1829384)

## ------------------------------------------------------------------------
### Data generating process
n_p=1200 # number of observations
n_y=n_p
N <- n_y + n_p
rho <-0.29 # parameter rho
sig=0.1 # parameter sigma
u=1
b=0.10
a=2
psi <-rnorm(n_p,0,u) ## vector of psi's
pp_y <- runif(n_y,0,1)
zeta <- rnorm(n_y,a,sig)
zeta1 <- rnorm(n_y,-a,sig)
pp1_y <- 1*(pp_y <b)
pp2_y <- 1*(pp_y >1-b)
pp3_y <- 1*(pp_y <=(1-b) & pp_y >=b)
psi_y <-rnorm(n_y,0,u)
y =  rho*psi_y+ pp1_y*zeta + pp2_y*zeta1 ## vector of y's

## ------------------------------------------------------------------------
D <- rbind(matrix(1,n_y,1),matrix(0,n_p,1)) ## vector of D's
Y_tilde <- rbind(matrix(y,n_y,1),matrix(psi,n_p,1))  ## concatenation of y then psi

## ------------------------------------------------------------------------
system.time(res <- test(Y_tilde ,D))

## ------------------------------------------------------------------------
system.time(res <- test(Y_tilde ,D,NULL,NULL,NULL,3,NULL))

## ------------------------------------------------------------------------
tuningParam<- vector(mode="list", length=6)
tuningParam[["p"]] <- 0.05
tuningParam[["epsilon"]] <- 0.05
tuningParam[["B"]] <-500
tuningParam[["y_grid"]] <- quantile(Y_tilde,seq(0,1,length.out=50))
tuningParam[["c"]] <- 0.3
tuningParam[["kappa"]] <- 0.001

## ------------------------------------------------------------------------
system.time(res <- test(Y_tilde ,D,NULL,NULL,NULL,3,tuningParam))

## ------------------------------------------------------------------------
n_p=1200
n_y=n_p
N <- n_y + n_p
sig=0.1
u=1
b=0.10
a=2
alp = 0.1
bet = 10

# Data Generating process
X_p = rbeta(n_p,alp ,  bet)+1 
X_y =  rbeta(n_y,alp ,  bet)+1 
transf <- function(X_y,   f0){
  res <-f0*sqrt(X_y)
  return(res)
}
psi <-rnorm(n_p,0,u)
pp_y <- runif(n_y,0,1)
zeta <- rnorm(n_y,a,sig)
zeta1 <- rnorm(n_y,-a,sig)
pp1_y <- 1*(pp_y <b)
pp2_y <- 1*(pp_y >1-b)
pp3_y <- 1*(pp_y <=(1-b) & pp_y >=b)
psi_y <-rnorm(n_y,0,u)
y =  rho*psi_y+ transf(X_y, 1)*(pp1_y*zeta + pp2_y*zeta1)    

## ------------------------------------------------------------------------
D <- rbind(matrix(1,n_y,1),matrix(0,n_p,1)) ## vector of D's
Y_tilde <- rbind(matrix(y,n_y,1),matrix(psi,n_p,1))## concatenation of y then psi

## ------------------------------------------------------------------------
X <- rbind(matrix(X_y,n_y,1),matrix(X_p,n_p,1))

## ------------------------------------------------------------------------
tuningParam<- vector(mode="list", length=6)
tuningParam[["p"]] <- 0.05 # the parameter c in  Section 3 in DGM
tuningParam[["epsilon"]] <- 0.05 # the parameter c in  Section 3 in DGM
tuningParam[["B"]] <-500 #the number of MC replications
tuningParam[["y_grid"]] <- quantile(Y_tilde,seq(0,1,length.out=30))
tuningParam[["c"]] <- 0.3 # the parameter c in  Section 3 in DGM
tuningParam[["kappa"]] <- 0.001  #the parameter kappa  in  Section 3 in DGM

system.time(res <- test(Y_tilde ,D,X,NULL,NULL,3,tuningParam ))

T_n<-  res[[5]] 
p_value <- res[[7]]

## ---- fig.show='hold'----------------------------------------------------
sig=0.1
u=1
b=0.10
a=2
rho= 0.4

psi <- rnorm(n_p,0,u)
pp_y <- runif(n_y,0,1)
zeta <- rnorm(n_y,a,sig)
zeta1 <- rnorm(n_y,-a,sig)
pp1_y <- 1*(pp_y <b)
pp2_y <- 1*(pp_y >1-b)
pp3_y <- 1*(pp_y <=(1-b) & pp_y >=b)
psi_y <-rnorm(n_p,0,u) 
y =  rho*psi_y+ pp1_y*zeta + pp2_y*zeta1    

## ------------------------------------------------------------------------
system.time(g_star <- estimDev(psi,y))

## ---- fig.show='hold'----------------------------------------------------
t<- seq(-2.2,2.2, length.out=300)
plot( t, t- g_star(t),type="l",col=1 , lwd=2, xlim=c(-2.2,2.2), ylim=c(min(t- g_star(t))-0.1,max(t- g_star(t))+0.1))
abline(h=0)

