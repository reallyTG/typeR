library(fiberLD)


### Name: fled
### Title: Fiber length determination
### Aliases: fled

### ** Examples


library(fiberLD)
## using microscopy data (uncut fiber lengths in the increment core)
data(microscopy)
dat <- microscopy[1:200]
m1 <- fled(data=dat,data.type="microscopy",model="ggamma",r=2.5) 
summary(m1)
plot(m1)

## and with log normal model...
m2 <- fled(data=dat,data.type="microscopy",model="lognorm",r=2.5)
summary(m2)
plot(m2)

## Not run: 
##D  
##D ## using data measured by an optical fiber analyser
##D data(cell.length) 
##D d1 <- fled(data=cell.length,model="lognorm",r=6)
##D summary(d1)
##D plot(d1)
##D x11()
##D plot(d1,density.scale="uncut.core")
##D 
##D ## change the model to generalized gamma
##D ## and set lower and upper bounds on the parameters for 
##D ## the "L-BFGS-B" method ... 
##D d2 <- fled(data=cell.length,model="ggamma",r=6,lower=c(.12,1e-3,.05,rep(.3,4)),
##D       upper=c(.5,2,rep(7,5)))  
##D d2
##D summary(d2)
##D plot(d2,select=1)
## End(Not run)




