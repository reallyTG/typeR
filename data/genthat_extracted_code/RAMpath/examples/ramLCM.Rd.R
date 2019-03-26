library(RAMpath)


### Name: ramLCM
### Title: Conduct growth curve analysis
### Aliases: ramLCM

### ** Examples

data(ex3)
## Example 3. Growth curve models
gcm.all<-ramLCM(ex3, 1:6, ram.out=TRUE)
## plot the path diagram
bridge<-ramPathBridge(gcm.all$ram$latent, FALSE, FALSE)
plot(bridge, 'latent')

##unequal variance
gcm.all<-ramLCM(ex3, 1:6, ram.out=TRUE, equal.var=FALSE)

## missing data
gcm.all<-ramLCM(ex3, c(1,2,4,6), basis=c(1,2,4,6), ram.out=TRUE)

gcm.l<-ramLCM(ex3, 1:6, model='linear', ram.out=TRUE)

## with a predictor
gcm.pred<-ramLCM(ex3, c(1,2,4,6), model='linear', basis=c(1,2,4,6), 
                 predictor=c(3,5), ram.out=TRUE)
bridge3<-ramPathBridge(gcm.pred$ram$linear)
plot(bridge3, 'gcmlinear')



