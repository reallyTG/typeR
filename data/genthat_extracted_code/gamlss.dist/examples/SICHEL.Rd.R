library(gamlss.dist)


### Name: SICHEL
### Title: The Sichel distribution for fitting a GAMLSS model
### Aliases: SICHEL dSICHEL pSICHEL qSICHEL rSICHEL VSICHEL tofySICHEL
###   ZASICHEL dZASICHEL pZASICHEL qZASICHEL rZASICHEL ZISICHEL dZISICHEL
###   pZISICHEL qZISICHEL rZISICHEL
### Keywords: distribution regression

### ** Examples

SICHEL()# gives information about the default links for the  Sichel distribution 
#plot the pdf using plot 
plot(function(y) dSICHEL(y, mu=10, sigma=1, nu=1), from=0, to=100, n=100+1, type="h") # pdf
# plot the cdf
plot(seq(from=0,to=100),pSICHEL(seq(from=0,to=100), mu=10, sigma=1, nu=1), type="h")   # cdf
# generate random sample
tN <- table(Ni <- rSICHEL(100, mu=5, sigma=1, nu=1))
r <- barplot(tN, col='lightblue')
# fit a model to the data 
# library(gamlss)
# gamlss(Ni~1,family=SICHEL, control=gamlss.control(n.cyc=50))



