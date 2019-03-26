library(R0)


### Name: sa.GT
### Title: Sensitivity analysis of reproduction ratio with varying GT
###   distribution
### Aliases: sa.GT

### ** Examples
## Not run: 
##D #Loading package
##D library(R0)
##D 
##D ## Data is taken from the paper by Nishiura for key transmission parameters of an institutional
##D ## outbreak during 1918 influenza pandemic in Germany)
##D ## Here we will test GT with means of 1 to 5, each time with SD constant (1)
##D ## GT and SD can be either fixed value or vectors of values
##D ## Actual value in simulations may differ, as they are adapted according to the distribution type
##D data(Germany.1918)
##D tmp<-sa.GT(incid=Germany.1918, GT.type="gamma", GT.mean=seq(1,5,1), GT.sd.range=1, begin=1, end=27,
##D            est.method="EG")
##D 
##D ## Results are stored in a matrix, each line dedicated to a (mean,sd) couple
##D plot(x=tmp[,"GT.Mean"], xlab="mean GT (days)", y=tmp[,"R"], ylim=c(1.2, 2.1), ylab="R0 (95##D 
##D      type="p", pch=19, col="black", main="Sensitivity of R0 to mean GT")
##D arrows(x0=as.numeric(tmp[,"GT.Mean"]), y0=as.numeric(tmp[,"CI.lower"]), 
##D        y1=as.numeric(tmp[,"CI.upper"]), angle=90, code=3, col="black", length=0.05)
##D 
##D ## One could tweak this example to change sorting of values (per mean, or per standard deviation)
##D ## eg: 'x=tmp[,c('GT.Mean')]' could become 'x=tmp[,c('GT.SD')]'
## End(Not run)



