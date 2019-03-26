library(TVsMiss)


### Name: plot.TVsMiss
### Title: plot solution path from the fitted "TVsMiss" object
### Aliases: plot.TVsMiss

### ** Examples

n <- 50
p <- 8
beta <- c(3,0,1.5,0,2,rep(0,p-5))
xm <- matrix(rnorm(n*p),ncol = p, nrow = n)
y <- xm %*% beta + rnorm(n)
colnames(xm) <- paste0("Var_",1:p)

fit01 <- tvsmiss(x=xm,y=y)
fit01$selection_beta
fit01$beta_matrix
plot(fit01)
plot(fit01,x.log=TRUE,label = FALSE)
plot(fit01,x.log=TRUE,label = TRUE)

fit04 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "BIC")
fit04$selection_beta
fit04$beta_matrix
plot(fit04)
plot(fit04,x.log = TRUE)
plot(fit04,x.log = TRUE,label = TRUE)




