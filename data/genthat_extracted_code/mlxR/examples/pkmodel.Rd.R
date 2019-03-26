library(mlxR)


### Name: pkmodel
### Title: Easy simulation of PK models Easy simulation of basic PK models
###   See http://simulx.webpopix.org/mlxr/pkmodel/ for more details.
### Aliases: pkmodel

### ** Examples

   
## Not run: 
##D   adm <- list(time=c(2,14,20), amount=40)
##D   p   <- c(V=8, Cl=0.5,k12=0.3, k21=0.2)
##D   t   <- seq(0, 30, by=0.1)
##D   
##D   res   <- pkmodel(time = t, treatment = adm, parameter = p)
##D   
##D   print(ggplot(data=res, aes(x=time, y=cc)) + geom_line(size=1) +
##D     xlab("time (h)") + ylab("concentration (mg/L)"))
##D   
##D   adm <- list(time = c(1,23,37,45), amount = c(1,0.5,2,0.3))
##D   p <- c(Mtt=5, Ktr=1, ka=0.5, V=10, Vm=1, Km=0.6, p=0.5)
##D   t <- seq(0, 80, by=0.1)
##D   
##D   res <- pkmodel(t,adm,p)
##D   
##D   print(ggplot(data=res, aes(x=time, y=cc)) + geom_line(size=1) +
##D     xlab("time (h)") + ylab("concentration (mg/L)"))
##D   
##D   adm <- list( time = 2, amount = 40)
##D   
##D   p <- inlineDataFrame("
##D   id   ka   V    Cl
##D   1   0.5   4     1
##D   2     1   6     1
##D   3   1.5   6   1.5
##D   ")
##D   
##D   t <- seq(0, 30, by=0.1)
##D   
##D   res <- pkmodel(t,adm,p)
##D   
##D   print(ggplot(data=res, aes(x=time, y=cc, colour=id)) + geom_line(size=1) +
##D     xlab("time (h)") + ylab("concentration (mg/L)"))   
##D   adm <- list(time=seq(2, 100, by=24), amount=40, rate=5)
##D   p <- c(V=8, Cl=0.5, k12=0.3, k21=0.2, ke0=0.2)
##D   t <- seq(0, 50, by=0.1)
##D   
##D   res <- pkmodel(t,adm,p)
##D   
##D   if( require("reshape2") ){
##D     r <- melt(res, id='time', variable.name='c')
##D     print(ggplot(r, aes(time,value)) + geom_line(aes(colour = c),size=1) +
##D             ylab('concentration') + guides(colour=guide_legend(title=NULL)) +
##D             theme(legend.position=c(.9, .8)))
##D   } 
## End(Not run)



