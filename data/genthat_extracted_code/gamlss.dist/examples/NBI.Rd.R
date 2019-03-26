library(gamlss.dist)


### Name: NBI
### Title: Negative Binomial type I distribution for fitting a GAMLSS
### Aliases: NBI dNBI pNBI qNBI rNBI
### Keywords: distribution regression

### ** Examples

NBI()   # gives information about the default links for the Negative Binomial type I distribution  
# plotting the distribution
plot(function(y) dNBI(y, mu = 10, sigma = 0.5 ), from=0, to=40, n=40+1, type="h")
# creating random variables and plot them 
tN <- table(Ni <- rNBI(1000, mu=5, sigma=0.5))
r <- barplot(tN, col='lightblue')
# library(gamlss)
# data(aids)
# h<-gamlss(y~cs(x,df=7)+qrt, family=NBI, data=aids) # fits the model 
# plot(h)
# pdf.plot(family=NBI, mu=10, sigma=0.5, min=0, max=40, step=1)



