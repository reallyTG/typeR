rm(list = ls())
library(TVsMiss)
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

fit02 <- tvsmiss(x=xm,y=y,method = "BIC")
fit02$selection_beta
fit02$beta_matrix

fit03 <- tvsmiss(x=xm,y=y,penalty = "SCAD")
fit03$selection_beta
fit03$beta_matrix

fit04 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "BIC")
fit04$selection_beta
fit04$beta_matrix
plot(fit04)
plot(fit04,x.log = TRUE)
plot(fit04,x.log = TRUE,label = TRUE)

fit05 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "sVS",fold = 2)
fit05$selection_beta
fit05$beta_matrix

fit06 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "sVS",fold = 5)
fit06$selection_beta
fit06$beta_matrix

fit07 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "sEST",fold = 5)
fit07$selection_beta
fit07$beta_matrix

fit08 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "sBIC",fold = 5)
fit08$selection_beta
fit08$beta_matrix


n <- 50
p <- n
beta <- c(3,0,1.5,0,2,rep(0,p-5))
xm <- matrix(rnorm(n*p),ncol = p, nrow = n)
y <- xm %*% beta + rnorm(n)

fit09 <- tvsmiss(x=xm,y=y)
fit09$selection_beta
fit09$beta_matrix

fit10 <- tvsmiss(x=xm,y=y, penalty = "SCAD",method = "BIC")
fit10$selection_beta
fit10$beta_matrix

fit11 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "BIC1")
fit11$selection_beta
fit11$beta_matrix

fit12 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "BIC2")
fit12$selection_beta
fit12$beta_matrix

fit13 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "sBIC1")
fit13$selection_beta
fit13$beta_matrix

fit14 <- tvsmiss(x=xm,y=y,penalty = "SCAD",method = "sBIC1")
fit14$selection_beta
fit14$beta_matrix


n <- 50
p <- 8
beta <- c(3,0,1.5,0,2,rep(0,p-5))
xm <- matrix(rnorm(n*p),ncol = p, nrow = n)
y <- xm %*% beta + rnorm(n)
colnames(xm) <- paste0("Var_",1:p)
pair01 <- pairdata(cbind(y,xm))
nrow(pair01) == choose(n,2)
