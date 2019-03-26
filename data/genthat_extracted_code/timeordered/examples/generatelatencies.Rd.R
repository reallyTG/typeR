library(timeordered)


### Name: generatelatencies
### Title: Generates vector-clock latencies for each individual at each
###   time.
### Aliases: generatelatencies
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
l <- generatelatencies(ants, allindivs)
image(l[,,1000],axes=FALSE,frame=TRUE,col=rainbow(100))
axis(1, at = (1:ncol(l))/ncol(l), labels=colnames(l),tick=FALSE,las=2,cex.axis=0.2)
axis(2, at = (1:nrow(l))/nrow(l), labels=rownames(l),tick=FALSE,las=2,cex.axis=0.2)



