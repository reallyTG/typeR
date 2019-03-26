library(TVsMiss)


### Name: tvsmiss
### Title: fit and select variable(s) for data with missing value
### Aliases: tvsmiss

### ** Examples

n <- 50
p <- 8
beta <- c(3,0,1.5,0,2,rep(0,p-5))
xm <- matrix(rnorm(n*p),ncol = p, nrow = n)
y <- xm %*% beta + rnorm(n)
colnames(xm) <- paste0("Var_",1:p)

fit01 <- tvsmiss(x=xm,y=y)
fit01$selection_beta

fit02 <- tvsmiss(x=xm,y=y,method = "BIC")
fit02$selection_beta
fit02$beta_matrix

fit06 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "sVS",fold = 5)
fit06$selection_beta
fit06$beta_matrix




