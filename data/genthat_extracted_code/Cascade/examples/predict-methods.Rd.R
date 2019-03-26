library(Cascade)


### Name: predict
### Title: Prediction of the gene expressions after a knock-out experience
###   'predict'
### Aliases: predict predict-methods predict,ANY-method
###   predict,micro_array-method
### Keywords: methods

### ** Examples

data(Selection)
data(network)
#A nv value can chosen using the cutoff function
nv=.11
EGR1<-which(match(Selection@name,"EGR1")==1)
P<-position(network,nv=nv)

#We predict gene expression modulations within the network if EGR1 is experimentaly knocked-out. 
prediction_ko5<-predict(Selection,network,nv=nv,targets=EGR1)

#Then we plot the results. Here for example we see changes at time point t2:
plot(prediction_ko5,time=2,ini=P,label_v=Selection@name)



