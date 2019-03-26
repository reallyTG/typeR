## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(out.extra='style="display:block; margin: auto"'
    #, fig.align="center"
    #, fig.width=4.6, fig.height=3.2
    , fig.width=6, fig.height=3.75 #goldener Schnitt 1.6
    , dev.args=list(pointsize=10)
    , dev=c('png','pdf')
    )
knit_hooks$set(spar = function(before, options, envir) {
    if (before){
        par( las=1 )                   #also y axis labels horizontal
        par(mar=c(2.0,3.3,0,0)+0.3 )  #margins
        par(tck=0.02 )                          #axe-tick length inside plots             
        par(mgp=c(1.1,0.2,0) )  #positioning of axis title, axis labels, axis
     }
})
library(logitnorm) 
if( !require(ggplot2) ){
	print("To generate this vignette, ggplo2 is required.")
	exit(0)
}
library(reshape2)
# genVigs("logitnorm")

## ----densityPlots, spar=TRUE, echo=FALSE, fig.width=6*2, fig.height=3.75*2----
xGrid =c(0+.Machine$double.eps,seq(0,1, length.out=81)[-c(1,81)],1-.Machine$double.eps)
#explore chanign sigma at mu=0 
theta0 <- expand.grid(mu=seq(0,2,length.out=9),
sigma=10^seq(-0.5,0.5,length.out=5)) 
n <- nrow(theta0)

.calcDensityGrid <- function(
		### Calculate lognormal desnity for given combinations
		theta0	##<< matrix with columns mu and sigma
		,xGrid = seq(0,1, length.out=81)[-c(1,81)]
){ 
	dx <- apply( theta0, 1, function(theta0i){
				dx <- dlogitnorm(xGrid, mu=theta0i[1], sigma=theta0i[2])
			})
	dimnames(dx) <- list(iX=NULL,iTheta=NULL)
	ds <- melt(dx)	# two variables over time
	ds[1:10,]
	ds$mu <- rep(as.factor(round(theta0[,1],2)), each=length(xGrid))
	ds$sigma <- rep(as.factor(round(theta0[,2],2)), each=length(xGrid))
	ds$x <- rep(xGrid, nrow(theta0))
	ds
	### data frame with columns value,x,mu and sigma 
}

ds <- .calcDensityGrid(theta0,xGrid=xGrid)
p1 <- ggplot(ds, aes(x=x, y=value, color=sigma, linetype=sigma)) + geom_line(size=1) +
 facet_wrap(~mu,scales="free")+
 theme_bw() +
 theme(axis.title.x = element_blank()) +  ylab("density") +
 theme()
print(p1)

## ----cumDensityPlot, spar=TRUE-------------------------------------------
x <- seq(0,1, length.out=81) 
d <- plogitnorm(x, mu=0.5, sigma=0.5)
plot(d~x,type="l")

## ----momentsLogitnorm----------------------------------------------------
(theta <- momentsLogitnorm(mu=0.6,sigma=0.5))

## ----modeLogitnorm-------------------------------------------------------
(mle <- modeLogitnorm(mu=0.6,sigma=0.5))

## ----twCoefLogitnormMLE--------------------------------------------------
(theta <- twCoefLogitnormMLE(0.7,0.9))
x <- seq(0,1, length.out=81) 
d <- dlogitnorm(x, mu=theta[1,"mu"], sigma=theta[1,"sigma"])
plot(d~x,type="l")
abline(v=c(0.7,0.9), col="grey")

## ----twCoefLogitnormMLEFlat----------------------------------------------
(theta <- twCoefLogitnormMLEFlat(0.7))
x <- seq(0,1, length.out=81) 
d <- dlogitnorm(x, mu=theta[1,"mu"], sigma=theta[1,"sigma"])
plot(d~x,type="l")
abline(v=c(0.7), col="grey")

