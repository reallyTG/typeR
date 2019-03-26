library(rangemodelR)


### Name: rangemod1d
### Title: Range Cohesion Model for Ordered (and Non-spatial) Data
### Aliases: rangemod1d

### ** Examples

tempmat <- matrix(0,nrow=10,ncol=200,dimnames=list(letters[1:10],1:200))
tempmat <- as.matrix(apply(tempmat,2,function(x){rbinom(nrow(tempmat),1,
                     runif(1,0.1,1))}))
rownames(tempmat) <- letters[1:10]
temp <- rangemod1d(tempmat,cohesion = TRUE,var = NULL,rsize = "observed",reps = 5)
plot(temp[,1],ylim= c(min(temp[,1] -2),max(temp[,1]+2)),pch = 16,ylab = 'Species Richness')
segments(1:10,y0=temp[,1]-temp[,2],y1= temp[,1]+temp[,2])



