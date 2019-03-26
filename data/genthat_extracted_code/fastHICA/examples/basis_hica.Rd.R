library(fastHICA)


### Name: basis_hica
### Title: Construction of the HICA basis
### Aliases: basis_hica

### ** Examples

## Not run:

##########################################################
# Example - Independent sources and overlapping loadings #
##########################################################

c1=c(0,0,0,0,1,1)
c2=c(1,1,1,1,0,0)
c3=c(1,1,0,0,0,0)

s1=runif(400,0,20)
s2=runif(400,0,20)
s3=runif(400,0,20)

# Here we generate the simulated dataset

X=s1%*%t(c1)+s2%*%t(c2)+s3%*%t(c3)+rnorm(6*400,0,1)

# Here we perform HICA on the simulated dataset

basis=basis_hica(X,5)

# Here we plot the 3 main components of HICA basis 
# (according to the energy criterium) for 4th level

energy=energy_hica(basis,6,5,plot=TRUE)
ex4=extract_hica(energy,3,4)
loa4=ex4$C

par( mfrow = c(3,1))
barplot(loa4[,1], ylim = c(-1, 1),main="HICA transform - Level 4",
ylab="1st component",xlab="Coordinate",names.arg=1:6,col="red",mgp=c(2.5,1,0))
barplot(loa4[,2], ylim = c(-1, 1),ylab="2nd component",
xlab="Coordinate",names.arg=1:6,col="green",mgp=c(2.5,1,0))
barplot(loa4[,3], ylim = c(-1, 1),ylab="3rd component",
xlab="Coordinate",names.arg=1:6,col="blue",mgp=c(2.5,1,0))

## End (Not run)




