library(SCI)


### Name: fitSCI
### Title: Standardized Climate Index (SCI)
### Aliases: fitSCI fitSCI.default transformSCI transformSCI.default
### Keywords: ts

### ** Examples

##
## generate artificial data
##
set.seed(101)
n.years <- 60
date <- rep(1:n.years,each=12) + 1950 + rep((0:11)/12,times=n.years)
## Precipitation
PRECIP <- (0.25*sin( 2 * pi * date) + 0.3)*rgamma(n.years*12, shape = 3, scale = 1)
PRECIP[PRECIP<0.1] <- 0
## Potential Evapotranspiration
PET <- 0.5*sin( 2 * pi * date)+1.2+rnorm(n.years*12,0,0.2)
## display test data
matplot(date,cbind(PRECIP,PET),t=c("h","l"),col=c("blue","red"),lty=1)
legend("topright",legend=c("PRECIPitation","temperature"),fill=c("blue","red"))

##
## example SPI
##
spi.para <- fitSCI(PRECIP,first.mon=1,distr="gamma",time.scale=6,p0=TRUE)
spi.para
spi <- transformSCI(PRECIP,first.mon=1,obj=spi.para)
plot(date,spi,t="l")

##
## effect of time.scale on SPI
##
spi.1.para <- fitSCI(PRECIP,first.mon=1,time.scale=1,distr="gamma",p0=TRUE)
spi.12.para <- fitSCI(PRECIP,first.mon=1,time.scale=12,distr="gamma",p0=TRUE)
spi.1 <- transformSCI(PRECIP,first.mon=1,obj=spi.1.para)
spi.12 <- transformSCI(PRECIP,first.mon=1,obj=spi.12.para)
matplot(date,cbind(spi.1,spi.12),t="l",lty=1,col=c("red","blue"),lwd=c(1,2))
legend("topright",legend=c("time.scale=1","time.scale=12"),fill=c("red","blue"))

##
## example SPEI
##
if(require(evd)){
    spei.para <- fitSCI(PRECIP-PET,first.mon=1,time.scale=6,distr="gev",p0=FALSE)
    spei <- transformSCI(PRECIP-PET,first.mon=1,obj=spei.para)
    plot(date,spei,t="l")
}

##
## effect of changing different distribution for SPEI computation
##
spei.genlog.para <- fitSCI(PRECIP-PET,first.mon=1,time.scale=6,distr="genlog",p0=FALSE)
spei.genlog <- transformSCI(PRECIP-PET,first.mon=1,obj=spei.genlog.para)
if(require(evd)){lines(date,spei.genlog, col="red")} else {plot(date,spei.genlog,t="l")}
## in this case: only limited effect.
## generally: optimal choice of distribution: user responsibility.

##
## use a 30 year reference period for SPI parameter estimation
##
sel.date <- date>=1970 & date<2000
spi.ref.para <- fitSCI(PRECIP[sel.date],first.mon=1,distr="gamma",time.scale=6,p0=TRUE)
## apply the the parameters of the reference period to all data
## also outside the reference period
spi.ref <- transformSCI(PRECIP,first.mon=1,obj=spi.ref.para)
plot(date,spi.ref,t="l",col="blue",ylim=c(-5,5),lwd=2)
lines(date[sel.date],spi.ref[sel.date],col="red",lwd=3)
legend("bottom",legend=c("reference period","extrapolation period"),fill=c("red","blue"),
       horiz=TRUE)

##
## use "start.fun.fix" in instances where maximum likelyhood estimation fails
##
## force failure of maximum likelyhood estimation by adding "strange" value
## a warning should be issued
xx <- PRECIP-PET; xx[300] <- 1000
spei.para <- fitSCI(xx,first.mon=2,time.scale=1,p0=FALSE,distr="gev")
spei.para$dist.para
## use start.fun, usually ment for estimating inital values for
## parameter optimisation if maximum likelihood estimation fails
spei.para <- fitSCI(xx,first.mon=2,time.scale=1,p0=FALSE,distr="gev",
                    start.fun.fix=TRUE)
spei.para$dist.para

##
## usage of sci.limit to truncate unrealistic SCI values
## 
PRECIP.mod <- PRECIP
PRECIP.mod[300] <- 100 ## introduce spuriously large value
spi.mod.para <- fitSCI(PRECIP.mod,first.mon=1,time.scale=3,p0=TRUE,distr="gamma")
plot(transformSCI(PRECIP.mod,first.mon=1,obj=spi.mod.para,sci.limit=Inf),
     t="l",col="blue",lwd=2)
lines(transformSCI(PRECIP.mod,first.mon=1,obj=spi.mod.para,sci.limit=4),col="red")

##
## how to modify settings of function "mledist" used for parameter identification
## 
## identify parameters with standard settings
spi.para <- fitSCI(PRECIP,first.mon=1,distr="gamma",time.scale=6,p0=TRUE)
## add lower and upper limits for parameter identification
lower.lim <- apply(spi.para$dist.para,1,min) - 0.5*apply(spi.para$dist.para,1,sd)
upper.lim <- apply(spi.para$dist.para,1,max) + 0.5*apply(spi.para$dist.para,1,sd)
spi.para.limit <- fitSCI(PRECIP,first.mon=1,distr="gamma",time.scale=6,p0=TRUE,
                         mledist.par=list(lower=lower.lim, upper=upper.lim))

##
## how to write an own start.fun
## (required if distributions not mentioned in "dist.start" are used)
##
## function with same arguments as "dist.start" 
my.start <- function(x,distr="gamma"){
### code based on "mmedist" in package "fitdistrplus"
    ppar <- try({
        n <- length(x)
        m <- mean(x)
        v <- (n - 1)/n * var(x)
        shape <- m^2/v
        rate <- m/v
        list(shape = shape, rate = rate)},TRUE)
    if (class(ppar) == "try-error") ## function has to be able to return NA parameters
        ppar <- list(shape = NA, rate = NA)
    return(ppar)
}
my.start(PRECIP)
spi.para <- fitSCI(PRECIP,first.mon=1,time.scale=6,p0=TRUE,
                   distr="gamma",start.fun=my.start)



