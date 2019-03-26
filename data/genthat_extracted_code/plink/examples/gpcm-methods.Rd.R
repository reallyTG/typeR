library(plink)


### Name: gpcm-methods
### Title: Generalized Partial Credit Model Response Probabilities
### Aliases: gpcm gpcm-methods gpcm,matrix,numeric-method
###   gpcm,data.frame,numeric-method gpcm,list,numeric-method
###   gpcm,irt.pars,ANY-method gpcm,sep.pars,ANY-method
### Keywords: methods distribution

### ** Examples

###### Unidimensional Examples ######
## Partial Credit Model
## Item parameters from Embretson & Reise (2000, p. 108) item 5
b <- t(c(-2.519,-.063,.17,2.055))
x <- gpcm(b,5)
plot(x) 

## Generalized Partial Credit Model
## Item parameters from Embretson & Reise (2000, p. 112) items 5-7
a <- c(.683,1.073,.583)
b <- matrix(c(-3.513,-.041,.182,NA,-.873,.358,-.226,
  1.547,-4.493,-.004,NA,NA),3,4,byrow=TRUE)
pars <- cbind(a,b) # Does not include a location parameter
rownames(pars) <- paste("Item",5:7,sep="") 
colnames(pars) <- c("a",paste("b",1:4,sep=""))
cat <- c(4,5,3)
x <- gpcm(pars,cat,seq(-3,3,.05))
plot(x)

## Item parameters from Muraki (1996, p. 154)
a <- c(1,.5)
b <- matrix(c(.25,-1.75,1.75,.75,-1.25,1.25),2,3,byrow=TRUE)
pars <- cbind(a,b) # Include a location parameter
rownames(pars) <- paste("Item",1:2,sep="")
colnames(pars) <- c("a","b",paste("d",1:2,sep=""))
cat <- c(3,3)
x <- gpcm(pars,cat,location=TRUE,print.mod=TRUE, D=1.7)
# Plot category curves for two items
matplot(x@prob$theta,x@prob[,2:4],xlab="Theta",ylab="Probability",
  ylim=c(0,1),lty=1,type="l",col="black") 
par(new=TRUE)
matplot(x@prob$theta,x@prob[,5:7],xlab="Theta",ylab="Probability",
  ylim=c(0,1),lty=3,type="l",col="black") 


###### Multidimensional Examples ######
## Multidimensional Partial Credit Model
pars <- matrix(c(2.4207,0.245,-1.1041,NA,
2.173,-0.4576,NA,NA,
2.1103,-0.8227,.4504,NA,
3.2023,1.0251,-.7837,-1.3062),4,4,byrow=TRUE)
cat <- c(4,3,4,5)
x <- gpcm(pars,cat,dimensions=2,print.mod=TRUE)
# plot combined item category surfaces
# The screen argument adjusts the orientation of the axes
plot(x,screen=list(z=-60,x=-70))

## Multidimensional Generalized Partial Credit Model
a <- matrix(c(.873, .226, .516, .380, .613, .286 ),3,2,byrow=TRUE)
b <- matrix(c(2.255, 1.334, -.503, -2.051, -3.082,
1.917, 1.074, -.497, -1.521, -2.589,
1.624, .994, -.656, -1.978, NA),3,5,byrow=TRUE)
pars <- cbind(a,b)
cat <- c(6,6,5)
x <- gpcm(pars,cat,dimensions=2,print.mod=TRUE)

# plot combined item category surfaces
plot(x,screen=list(z=-40,x=-60), auto.key=list(space="right"))

# plot separated item category surfaces for item two
plot(x,items=2,separate=TRUE,drape=TRUE,panels=1)

# Compute response probabilities for a single three-category item with
# three dimensions. Plot the response surfaces for the first two 
# dimensions conditional on each theta value on the third dimension
pars <- matrix(c(1.1999,0.5997,0.8087,2.1730,-1.4576),1,5)
x <- gpcm(pars,3,dimensions=3,theta=-4:4)
plot(x, screen=list(z=-30,x=-60))



