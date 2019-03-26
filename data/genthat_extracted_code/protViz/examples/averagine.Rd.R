library(protViz)


### Name: averagine
### Title: averagine - a data set conatining isotope envelopes of averagine
###   peptides
### Aliases: averagine

### ** Examples


data(averagine)
r<-seq(0,1,length=200); cm<-c(rgb(r,r,r), '#555599')
image(m<-as.matrix(averagine), col=rev(cm), axes=FALSE, main='protViz
averagine data - normalized isotope intensities ',
sub='the blue color indicates fields with value 0.',
xlab='isotops',
ylab='mass');
box()
axis(1, seq(0,1,length=nrow(m)), 1:nrow(m));
axis(2, seq(0,1,length=10), colnames(m)[seq(1,ncol(m), length=10)])




