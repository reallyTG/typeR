library(assist)


### Name: predict.ssr
### Title: Calculate Predictions and Posterior Standard Deviations for a
###   ssr Object
### Aliases: predict.ssr
### Keywords: file

### ** Examples

data(acid)

# tp.pseudo calculates the pseudo kernel
acid.fit<- ssr( ph ~ t1 + x1 + x2, rk = list(tp.pseudo(t1), 
       tp.pseudo(list(x1, x2))), spar = "m", data=acid)

# extract the main effect of t1 
grid <- seq(min(acid$t1),max(acid$t1),length=100)
p <- predict(acid.fit,data.frame(t1=grid,x1=0,x2=0),
     terms=c(0,1,0,0,1,0))

# extract the main effect of (x1,x2) 
grid <- expand.grid(x1=seq(min(acid$x1),max(acid$x1),length=20),
     x2=seq(min(acid$x2),max(acid$x2),length=20))
p <- predict(acid.fit,data.frame(t1=0,x1=grid$x1,x2=grid$x2),
     terms=c(0,0,1,1,0,1),pstd=FALSE)




