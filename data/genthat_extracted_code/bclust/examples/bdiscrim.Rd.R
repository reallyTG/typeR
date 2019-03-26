library(bclust)


### Name: bdiscrim
### Title: discrimination using a Bayesian linear model
### Aliases: bdiscrim

### ** Examples

data(gaelle)
gaelle.id<-rep(1:13,rep(4,13)) # all mutants have 4 replicates
gaelle.lab<-c("d172","d263","isa2",
"sex4","dpe2","mex1","sex3","pgm","sex1","WsWT",
"tpt","RLDWT","ke103")

gaelle.bdiscrim<-bdiscrim(gaelle[-(1:3),],
training.id=gaelle.id,training.labels=gaelle.lab,
transformed.par=c(-1.84,-0.99,1.63,0.08,-0.16,-1.68),
predict=gaelle[1:3,], predict.label="ColWT")
# classify ColWT to one of the types

par(mfrow=c(1,1)) #retreive graphic defaults 
par(mar = c(5, 4, 4, 2) + 0.1) # leave some space for labels

ColWT.prob<-as.vector(gaelle.bdiscrim$probs)

# plots discrimination probabilities
bp <- barplot(ColWT.prob,ylim=c(0,1)) #plot bars
title("ColWT Discrimination")
text(bp, par("usr")[3]-0.05, srt = 90,adj=1,
labels = colnames(gaelle.bdiscrim$probs), 
xpd = TRUE) 
#plot variable labels

mtext(1, text = "Mutant", line = 4,cex=1.5)
# add x axis label
mtext(2, text = "Probability", line = 3,cex=1.2)
# add y axis labels
abline(h=1/length(ColWT.prob)) 
# draw plot a as a reference line prior probabilities line



# plots sorted discrimination probabilities
par(mfrow=c(1,1)) #retreive graphic defaults 
par(mar = c(5, 4, 4, 2) + 0.1) # leave some space for labels
bp <- barplot(sort(ColWT.prob,decreasing=TRUE),ylim=c(0,1),
col=heat.colors(length(ColWT.prob))) #plot bars
text(bp, par("usr")[3]-0.05, srt = 90,adj=1,
labels = colnames(gaelle.bdiscrim$probs)
[order(ColWT.prob,decreasing=TRUE)], 
xpd = TRUE) #plot variable labels
mtext(1, text = "Mutant", line = 4,cex=1.5)# add x axis label
mtext(2, text = "Probability", line = 3,cex=1.2)# add y axis labels
abline(h=1/length(ColWT.prob))


varclassimp<-gaelle.bdiscrim$varclass
#use thresholds to define blob colors

     blob<-matrix(0,nrow(varclassimp),ncol(varclassimp))
     blob[varclassimp<=0]<-0 
     blob[varclassimp>0]<-1
     blob[varclassimp>1]<-2
     blob[varclassimp>3]<-3
     blob[varclassimp>5]<-4
#log bayes factor thresholding 

varimp<-gaelle.bdiscrim$var
varcol<-rep(0,ncol(gaelle))
varcol[varimp>0]<-1


var.order<-order(gaelle.bdiscrim$var,decreasing=TRUE)
profileplot(x=gaelle[-(1:3),var.order],rep.id=gaelle.id,
labels=gaelle.lab,scale=10,blob.matrix=blob,ylab.mar=5,
xlab.mar=7)
#plot var class importance on profile plot using blobs
# and sort variables according to variable importance values



viplot(varimp=varimp, xlab=colnames(gaelle)[var.order],
xlab.mar=10,sort=TRUE,col=varcol[var.order])
#plot sorted variable importances 



