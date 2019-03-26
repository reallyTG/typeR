library(eegkit)


### Name: eegsmooth
### Title: Spatial and/or Temporal Smoothing of EEG Data
### Aliases: eegsmooth

### ** Examples

##########   EXAMPLE 1: Temporal    ##########

# get "PZ" electrode of "c" subjects in "eegdata" data
data(eegdata)
idx <- which(eegdata$channel=="PZ" & eegdata$group=="c")
eegdata <- eegdata[idx,]

# temporal smoothing
eegmod <- eegsmooth(eegdata$voltage,time=eegdata$time)

# define data for prediction
time <- seq(min(eegdata$time),max(eegdata$time),length.out=100)
yhat <- predict(eegmod,newdata=time,se.fit=TRUE)

# plot results using eegtime
eegtime(time*1000/255,yhat$fit,voltageSE=yhat$se.fit,ylim=c(-4,4),main="Pz")



##########   EXAMPLE 2: Spatial   ##########

# get time point 65 (approx 250 ms) of "c" subjects in "eegdata" data
data(eegdata)
idx <- which(eegdata$time==65L & eegdata$group=="c")
eegdata <- eegdata[idx,]

# remove ears, nose, and reference (Cz)
idx <- c(which(eegdata$channel=="X"),which(eegdata$channel=="Y"),
         which(eegdata$channel=="nd"),which(eegdata$channel=="Cz"))
eegdata <- eegdata[-idx,]

# match to eeg coordinates
data(eegcoord)
cidx <- match(eegdata$channel,rownames(eegcoord))

# spatial smoothing
eegmod <- eegsmooth(eegdata$voltage,space=eegcoord[cidx,1:3])

# use dense cap for prediction
mycap <- levels(factor(eegdata$channel))
ix <- eegcapdense(mycap,type="2d",index=TRUE)
data(eegdense)
space <- eegdense[ix,1:3]
yhat <- predict(eegmod,newdata=space)

# plot results using eegspace
#eegspace(space,yhat)
eegspace(eegdense[ix,4:5],yhat)



##########   EXAMPLE 3: Spatial-Temporal (not run)   ##########

# # get "c" subjects of "eegdata" data
# data(eegdata)
# idx <- which(eegdata$group=="c")
# eegdata <- eegdata[idx,]

# # remove ears, nose, and reference (Cz)
# idx <- c(which(eegdata$channel=="X"),which(eegdata$channel=="Y"),
#          which(eegdata$channel=="nd"),which(eegdata$channel=="Cz"))
# eegdata <- eegdata[-idx,]

# # match to eeg coordinates
# data(eegcoord)
# cidx <- match(eegdata$channel,rownames(eegcoord))

# # spatial-temporal smoothing
# eegmod <- eegsmooth(eegdata$voltage,space=eegcoord[cidx,1:3],time=eegdata$time)

# # time main effect
# newdata <- list(time=seq(min(eegdata$time),max(eegdata$time),length.out=100))
# yhat <- predict(eegmod,newdata=newdata,se.fit=TRUE,include="time")
# eegtime(newdata$time,yhat$fit,voltageSE=yhat$se.fit,ylim=c(-2,4),main="Time Main Effect")

# # space main effect
# mycap <- levels(factor(eegdata$channel))
# ix <- eegcapdense(mycap,type="2d",index=TRUE)
# data(eegdense)
# newdata <- list(space=eegdense[ix,1:3])
# yhat <- predict(eegmod,newdata=newdata,include="space")
# eegspace(newdata$space,yhat)

# # interaction effect (spatial map at time point 65)
# newdata <- list(space=eegdense[ix,1:3],time=rep(65,nrow(eegdense[ix,])))
# yhat <- predict(eegmod,newdata=newdata,include="space:time")
# eegspace(newdata$space,yhat)

# # full prediction (spatial map at time point 65)
# newdata <- list(space=eegdense[ix,1:3],time=rep(65,nrow(eegdense[ix,])))
# yhat <- predict(eegmod,newdata=newdata)
# eegspace(newdata$space,yhat)




