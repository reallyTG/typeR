library(gamlss.dist)


### Name: NBII
### Title: Negative Binomial type II distribution for fitting a GAMLSS
### Aliases: NBII dNBII pNBII qNBII rNBII
### Keywords: distribution regression

### ** Examples

NBII()  # gives information about the default links for the Negative Binomial type II distribution  
# plotting the distribution
plot(function(y) dNBII(y, mu = 10, sigma = 0.5 ), from=0, to=40, n=40+1, type="h")
# creating random variables and plot them 
tN <- table(Ni <- rNBII(1000, mu=5, sigma=0.5))
r <- barplot(tN, col='lightblue')
# library(gamlss)
# data(aids)
# h<-gamlss(y~cs(x,df=7)+qrt, family=NBII, data=aids) # fits a model 
# plot(h)
# pdf.plot(family=NBII, mu=10, sigma=0.5, min=0, max=40, step=1)



