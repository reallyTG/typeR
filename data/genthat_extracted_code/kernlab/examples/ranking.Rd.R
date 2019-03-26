library(kernlab)


### Name: ranking
### Title: Ranking
### Aliases: ranking ranking,matrix-method ranking,list-method
###   ranking,kernelMatrix-method
### Keywords: cluster classif

### ** Examples

data(spirals)

## create data from spirals
ran <- spirals[rowSums(abs(spirals) < 0.55) == 2,]

## rank points according to similarity to the most upper left point  
ranked <- ranking(ran, 54, kernel = "rbfdot",
                  kpar = list(sigma = 100), edgegraph = TRUE)
ranked[54, 2] <- max(ranked[-54, 2])
c<-1:86
op <- par(mfrow = c(1, 2),pty="s")
plot(ran)
plot(ran, cex=c[ranked[,3]]/40)




