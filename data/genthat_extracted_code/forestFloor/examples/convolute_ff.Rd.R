library(forestFloor)


### Name: convolute_ff
### Title: Cross-validated main effects interpretation for all feature
###   contributions.
### Aliases: convolute_ff

### ** Examples

## Not run: 
##D library(forestFloor)
##D library(randomForest)
##D 
##D #simulate data
##D obs=1000
##D vars = 6 
##D X = data.frame(replicate(vars,rnorm(obs)))
##D Y = with(X, X1^2 + 2*sin(X2*pi) + 8 * X3 * X4)
##D Yerror = 5 * rnorm(obs)
##D cor(Y,Y+Yerror)^2
##D Y= Y+Yerror
##D 
##D #grow a forest, remeber to include inbag
##D rfo=randomForest(X,Y,keep.inbag=TRUE)
##D 
##D ff = forestFloor(rfo,X)
##D 
##D ff = convolute_ff(ff) #return input oject with ff$FCfit included
##D 
##D #the convolutions correlation to the feature contribution
##D for(i in 1:6) print(cor(ff$FCmatrix[,i],ff$FCfit[,i])^2)
##D 
##D #plotting the feature contributions 
##D pars=par(no.readonly=TRUE) #save graphicals
##D par(mfrow=c(3,2),mar=c(2,2,2,2))
##D for(i in 1:6) {
##D   plot(ff$X[,i],ff$FCmatrix[,i],col="#00000030",ylim=range(ff$FCmatrix))
##D   points(ff$X[,i],ff$FCfit[,i],col="red",cex=0.2)
##D }
##D par(pars) #restore graphicals
## End(Not run)



