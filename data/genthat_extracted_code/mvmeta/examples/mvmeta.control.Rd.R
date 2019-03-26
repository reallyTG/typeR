library(mvmeta)


### Name: mvmeta.control
### Title: Ancillary Parameters for Controlling the Fit in mvmeta Models
### Aliases: mvmeta.control
### Keywords: models regression multivariate

### ** Examples

# PRINT THE ITERATIONS (SEE ?optim) AND CHANGE THE DEFAULT FOR STARTING VALUES
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98,
  control=list(showiter=TRUE,igls.iter=20))
  
# INPUT THE CORRELATION
model <- mvmeta(cbind(y1,y2),S=cbind(V1,V2),data=p53,control=list(Scor=0.5))



