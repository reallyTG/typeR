library(cancerTiming)


### Name: plotSegmentation
### Title: plot segmentation(s) against positions
### Aliases: plotSegmentation

### ** Examples

data(mutData)
segData<-data.frame(chromosome="17",start=c(0,1.8e7+1),
	end=c(1.8e7,max(mutData$position)),val=c(2,3))
cp1<-data.frame(chromosome="17",start=c(0,1.8e7+1),
	end=c(1.8e7,max(mutData$position)),val=c(1,1))
cp2<-data.frame(chromosome="17",start=c(0,1.8e7+1),
	end=c(1.8e7,max(mutData$position)),val=c(.9,2))
out<-plotSegmentation(list(total=segData,cp1=cp1,cp2=cp2),
	valId="val",lwd=2,ylab="Segmentation Value")
legend("topright",names(out),fill=out)



