library(psych)


### Name: fa.extension
### Title: Apply Dwyer's factor extension to find factor loadings for
###   extended variables
### Aliases: fa.extension fa.extend
### Keywords: multivariate

### ** Examples
 #The Dwyer Example
Ro <- Dwyer[1:7,1:7]
Roe <- Dwyer[1:7,8]
fo <- fa(Ro,2,rotate="none")
fe <- fa.extension(Roe,fo)

#an example from simulated data
set.seed(42) 
 d <- sim.item(12)    #two orthogonal factors 
 R <- cor(d)
 Ro <- R[c(1,2,4,5,7,8,10,11),c(1,2,4,5,7,8,10,11)]
 Roe <- R[c(1,2,4,5,7,8,10,11),c(3,6,9,12)]
 fo <- fa(Ro,2)
 fe <- fa.extension(Roe,fo)
 fa.diagram(fo,fe=fe)
 
 #create two correlated factors
 fx <- matrix(c(.9,.8,.7,.85,.75,.65,rep(0,12),.9,.8,.7,.85,.75,.65),ncol=2)
 Phi <- matrix(c(1,.6,.6,1),2)
 sim.data <- sim.structure(fx,Phi,n=1000,raw=TRUE)
 R <- cor(sim.data$observed)
 Ro <- R[c(1,2,4,5,7,8,10,11),c(1,2,4,5,7,8,10,11)]
 Roe <- R[c(1,2,4,5,7,8,10,11),c(3,6,9,12)]
 fo <- fa(Ro,2)
 fe <- fa.extension(Roe,fo)
 fa.diagram(fo,fe=fe)
 
 #now show how fa.extend works with the same data set
 #note that we have to make sure that the variables are in the order to do the factor congruence
 fe2 <- fa.extend(R,2,ov=c(1,2,4,5,7,8,10,11),ev=c(3,6,9,12),n.obs=1000)
 fa.diagram(fe2,main="factor analysis with extension variables")
 fa2 <- fa(sim.data$observed[,c(1,2,4,5,7,8,10,11,3,6,9,12)],2)
 factor.congruence(fe2,fa2)
 summary(fe2)
 
 #an example of extending an omega analysis
 
 
fload <- matrix(c(c(c(.9,.8,.7,.6),rep(0,20)),c(c(.9,.8,.7,.6),rep(0,20)),c(c(.9,.8,.7,.6),
        rep(0,20)),c(c(c(.9,.8,.7,.6),rep(0,20)),c(.9,.8,.7,.6))),ncol=5)
 gload <- matrix(rep(.7,5))
 five.factor <- sim.hierarchical(gload,fload,500,TRUE) #create sample data set
 ss <- c(1,2,3,5,6,7,9,10,11,13,14,15,17,18,19)
 Ro <- cor(five.factor$observed[,ss])
 Re <- cor(five.factor$observed[,ss],five.factor$observed[,-ss])
 om5 <-omega(Ro,5)   #the omega analysis
 om.extend <- fa.extension(Re,om5) #the extension analysis
 om.extend #show it
 #now, include it in an omega diagram
 combined.om <- rbind(om5$schmid$sl[,1:ncol(om.extend$loadings)],om.extend$loadings)
 omega.diagram(combined.om,main="Extended Omega") 
 



