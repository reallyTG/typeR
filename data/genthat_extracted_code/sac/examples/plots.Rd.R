library(sac)


### Name: plots
### Title: Visualized Model Diagnostic and Loglikelihood Plot
### Aliases: Graf.Diagnostic Plot.ll
### Keywords: device

### ** Examples

require(sac) #load the package
k<-30
n<-80
x<-rnorm(n,0,1)
x[(k+1):n]<-x[(k+1):n]+1.5
res<-SemiparChangePoint(x, alternative = "one.change")
Plot.ll(x, res$ll, col="blue")

## Nile data with one change-point: the annual flows drop in 1898 which corresponds 
## to k=28. It is believed to be caused by the building of the first Aswan dam.
if(! "package:sac" %in% search()) library(sac) 
    #if package sac has not been loaded, load it.
if(! "package:stats" %in% search()) library(stats)
data(Nile)
plot(Nile, type="p")
Nile.res<-SemiparChangePoint(Nile, alternative = "one.change")
Color<-c(1,2,3,4); LTY<-c(1,2,3,4)

## Plots of estimated distribution functions
Graf.Diagnostic(Nile, Nile.res$k.hat, length(Nile), Nile.res$alpha.hat, 
    Nile.res$beta.hat, Color, LTY, xlab = "x", ylab = "Estimated DF's", 
    main="Model Diagnostic for Nile Data", OneLegend = FALSE, lgnd1 = 
    c(1100, 0.15), lgnd2 = c(600, .99), arw1=c(780, .93, 1010, .9),
    arw2 = c(1165, .15, 1015, .24))

## Plot of loglikelihood function
Plot.ll(Nile, Nile.res$ll, col = "blue")
Plot.ll(Nile, Nile.res$ll, col = "blue", xaxis.lab = seq(1871,1970, length = 100), 
    xlab = "Year")



