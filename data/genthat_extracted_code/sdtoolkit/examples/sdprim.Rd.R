library(sdtoolkit)


### Name: sdprim
### Title: Patient Rule Induction Method Adapted For Scenario Discovery
### Aliases: sdprim
### Keywords: robust tree

### ** Examples


#Load some example data to play with:
data(quakes)
#quakes is a 1000 by 5 dataset of earthquake information.  This has no obvious
#policy significance, but we can use this built-in dataset to illustrate the use
#of PRIM.

#Here are the columns:
colnames(quakes)

#We will say magnitude is the output of interest, and call earthquakes greater
#5.0 'interesting.'  We can then call sdprim two different ways.

#First, make an input matrix from columns 1,2,3 and 5 
inputs <- quakes[,c(1:3,5)]  #could also do quakes[,-4]

#Now put our unthresholded y vector:
yout <- quakes[,"mag"] #could also do quakes[,4]

#Now we can either call sdprim and threshold inside PRIM, like this:
## Not run: myboxes <- sdprim(x=inputs, y=yout, thresh=5.0, threshtype=">")

#Or we can first threshold yout:
ythresh <- 1*(yout>5.0)

#and then call sdprim without worrying about the thresholds:
## Not run: myboxes <- sdprim(x=inputs, y=ythresh)




