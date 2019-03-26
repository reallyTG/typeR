library(gPCA)


### Name: gPCA.batchdetect
### Title: Guided Principal Components Analysis
### Aliases: gPCA.batchdetect
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(caseDat)
batch<-caseDat$batch
data<-caseDat$data
out<-gPCA.batchdetect(x=data,batch=batch,center=FALSE,nperm=250)
out$delta ; out$p.val

## Plots:
gDist(out)
CumulativeVarPlot(out,ug="unguided",col="blue")
PCplot(out,ug="unguided",type="1v2")
PCplot(out,ug="unguided",type="comp",npcs=4)



