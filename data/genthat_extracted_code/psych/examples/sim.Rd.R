library(psych)


### Name: sim
### Title: Functions to simulate psychological/psychometric data.
### Aliases: sim sim.simplex sim.minor sim.omega sim.general sim.parallel
###   sim.rasch sim.irt sim.npl sim.npn sim.poly sim.poly.npl sim.poly.npn
###   sim.poly.ideal sim.poly.ideal.npl sim.poly.ideal.npn sim.poly.mat
### Keywords: multivariate datagen

### ** Examples

simplex <- sim.simplex() #create the default simplex structure
lowerMat(simplex) #the correlation matrix
#create a congeneric matrix
congeneric <- sim.congeneric()
lowerMat(congeneric)
R <- sim.hierarchical()
lowerMat(R)
#now simulate categorical items with the hierarchical factor structure.  
#Let the items be dichotomous with varying item difficulties.
marginals = matrix(c(seq(.1,.9,.1),seq(.9,.1,-.1)),byrow=TRUE,nrow=2)
X <- sim.poly.mat(R=R,m=marginals,n=1000)
lowerCor(X) #show the raw correlations
#lowerMat(tetrachoric(X)$rho) # show the tetrachoric correlations (not run)
#generate a structure 
fx <- matrix(c(.9,.8,.7,rep(0,6),c(.8,.7,.6)),ncol=2)
fy <- c(.6,.5,.4)
Phi <- matrix(c(1,0,.5,0,1,.4,0,0,0),ncol=3)
R <- sim.structure(fx,Phi,fy) 
cor.plot(R$model) #show it graphically

simp <- sim.simplex()
#show the simplex structure using cor.plot
cor.plot(simp,colors=TRUE,main="A simplex structure")
#Show a STARS model 
simp <- sim.simplex(alpha=.8,lambda=.4)
#show the simplex structure using cor.plot
cor.plot(simp,colors=TRUE,main="State Trait Auto Regressive Simplex" )

dichot.sim <- sim.irt()  #simulate 5 dichotomous items
poly.sim <- sim.poly(theta=dichot.sim$theta)  #simulate 5 polytomous items that correlate 
  #with the dichotomous items




