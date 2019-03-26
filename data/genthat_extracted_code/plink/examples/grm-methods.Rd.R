library(plink)


### Name: grm-methods
### Title: Graded Response Model Probabilities
### Aliases: grm grm-methods grm,matrix,numeric-method
###   grm,data.frame,numeric-method grm,list,numeric-method
###   grm,irt.pars,ANY-method grm,sep.pars,ANY-method
### Keywords: methods distribution

### ** Examples

###### Unidimensional Examples ######
## Cumulative probabilities 
## Item parameters from Embretson & Reise (2000, p. 101) items 9-11
# Includes a location parameter
a <- c(2.09,1.18,1.69)
b <- matrix(c(-1.07,-1.03,.39,.86,1.78,1.85,-.87,-.39,.31,NA,
  -1.4,-.42,NA,NA,-1.74),3,5) 
pars <- cbind(a,b)
rownames(pars) <- paste("Item",9:11,sep=" ")
colnames(pars) <- c("a","b",paste("c",1:4,sep=""))
cat <- c(3,4,5)
x <- grm(pars,cat,location=TRUE)
plot(x)

## Item parameters from Kolen & Brennan (2004, p. 210)
# Use theta values from -3 to 3 with an increment of 0.5
pars <- t(c(1.2,-.5,.6,1.1,1.3))
x <- grm(pars,5,theta=seq(-3,3,.05))
plot(x,item.lab=FALSE)


## Category probabilities
## Single item
pars <- t(c(1.2,-.5,.6,1.1,1.3))
x <- grm(pars,5,seq(-3,3,.05),catprob=TRUE)
plot(x,item.lab=FALSE)

# Items without location parameter
a <- c(2.09,1.18,1.69)
b <- matrix(c(-1.93,-2.81,-1.46,-.2,-.64,.08,NA,.37,.81,NA,NA,2.13),3,4) 
pars <- cbind(a,b)
rownames(pars) <- paste("Item",9:11,sep=" ")
colnames(pars) <- c("a",paste("b",1:4,sep=""))
cat <- c(3,4,5)
x <- grm(pars,cat,catprob=TRUE)
plot(x)

## Create sep.pars object then compute category probabilities
a <- c(2.09,1.18,1.69)
b <- matrix(c(-1.93,-2.81,-1.46,-.2,-.64,.08,NA,.37,.81,NA,NA,2.13),3,4) 
pars <- cbind(a,b)
cat <- c(3,4,5)
pm <- as.poly.mod(3,"grm")
out <- sep.pars(pars,cat,pm)
x <- grm(out,catprob=TRUE)
plot(x)


###### Multidimensional Examples ######
## Cumulative probabilities
a <- matrix(c(.873, .226, .516, .380, .613, .286 ),3,2,byrow=TRUE)
d <- matrix(c(2.255, 1.334, -.503, -2.051, -3.082,
1.917, 1.074, -.497, -1.521, -2.589,
1.624, .994, -.656, -1.978, NA),3,5,byrow=TRUE)
pars <- cbind(a,d)
cat <- c(6,6,5)
x <- grm(pars,cat,dimensions=2)
plot(x)

# Plot separated response surfaces
plot(x, separate=TRUE, drape=TRUE)

## Category Probabilities
## Use {pars} an {cat} from the example above
x <- grm(pars,cat,dimensions=2, catprob=TRUE)

# plot combined item category surfaces
# The screen argument adjusts the orientation of the axes
plot(x,screen=list(z=-40,x=-60), auto.key=list(space="right"))



