library(gamlss.dist)


### Name: PO
### Title: Poisson distribution for fitting a GAMLSS model
### Aliases: PO dPO pPO qPO rPO
### Keywords: distribution regression

### ** Examples

PO()# gives information about the default links for the Poisson distribution  
# fitting data using PO()

# plotting the distribution
plot(function(y) dPO(y, mu=10 ), from=0, to=20, n=20+1, type="h")
# creating random variables and plot them 
tN <- table(Ni <- rPO(1000, mu=5))
 r <- barplot(tN, col='lightblue')
# library(gamlss)
# data(aids)
# h<-gamlss(y~cs(x,df=7)+qrt, family=PO, data=aids) # fits the constant+x+qrt model 
# plot(h)
# pdf.plot(family=PO, mu=10, min=0, max=20, step=1)



