library(mvabund)


### Name: meanvar.plot
### Title: Construct Mean-Variance plots for Multivariate Abundance Data
### Aliases: meanvar.plot meanvar.plot.mvabund meanvar.plot.mvformula
###   meanvar.plot,mvabund-method meanvar.plot,mvformula-method
###   meanvar.plot,formula-method meanvar.plot,matrix-method
###   meanvar.plot,data.frame-method
### Keywords: hplot

### ** Examples

require(graphics)

## Load the tikus dataset:
data(tikus)
tikusdat <- mvabund(tikus$abund)
year <- tikus$x[,1]

## Plot mean-variance plot for a mvabund object with a log scale (default):
meanvar.plot(tikusdat) 	

## Again but without log-transformation of axes:
meanvar.plot(tikusdat,log="") 	

## A mean-variance plot, data organised by year, 
## for 1981 and 1983 only, as in Figure 7a of Warton (2008):
is81or83 <- year==81 | year==83
meanvar.plot(tikusdat~year, subset=is81or83, col=c(1,10))



