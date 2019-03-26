library(eegkit)


### Name: eegcoord
### Title: EEG Cap Coordinates
### Aliases: eegcoord
### Keywords: datasets

### ** Examples

##########   EXAMPLE   ##########

data(eegcoord)
enames <- rownames(eegcoord)
# plot3d(eegcoord[,1],eegcoord[,2],eegcoord[,3],size=10,col="green")
# text3d(eegcoord[,1],eegcoord[,2],eegcoord[,3],texts=enames,col="blue")
plot(eegcoord[,4],eegcoord[,5],cex=2,col="green",pch=19)
text(eegcoord[,4],eegcoord[,5],labels=enames,col="blue")




