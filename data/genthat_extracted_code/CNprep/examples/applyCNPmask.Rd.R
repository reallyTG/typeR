library(CNprep)


### Name: applyCNPmask
### Title: Apply a mask to a table of copy number events.
### Aliases: applyCNPmask

### ** Examples

## Not run: 
##D data(segexample)
##D data(ratexample)
##D data(normsegs)
##D data(cnpexample)
##D segtable<-CNpreprocessing(segall=segexample[segexample[,"ID"]=="WZ1",],
##D ratall=ratexample,"ID","start","end",chromcol="chrom",bpstartcol="chrom.pos.start",
##D bpendcol="chrom.pos.end",blsize=50,minjoin=0.25,cweight=0.4,bstimes=50,
##D chromrange=1:22,distrib="Rparallel",njobs=2,modelNames="E",normalength=normsegs[,1],
##D normalmedian=normsegs[,2])
##D #form a eventIndex vector
##D eventIndex<-rep(0,nrow(segtable))
##D eventIndex[segtable[,"marginalprob"]<1e-4&segtable[,"negtail"]>
##D 0.999&segtable[,"mediandev"]<0] <- -1
##D eventIndex[segtable[,"marginalprob"]<1e-4&segtable[,"negtail"]>
##D 0.999&segtable[,"mediandev"]>0] <- 1
##D segtable<-cbind(segtable,eventIndex)
##D #form a cnpindex vector
##D namps17<-cnpexample[cnpexample[,"copy.num"]=="amp",]
##D aCNPmask<-makeCNPmask(imat=namps17,chromcol=2,startcol=3,endcol=4,
##D nprof=1203,uthresh=0.02,dthresh=0.008)
##D ndels17<-cnpexample[cnpexample[,"copy.num"]=="del",]
##D dCNPmask<-makeCNPmask(imat=ndels17,chromcol=2,startcol=3,endcol=4,
##D nprof=1203,uthresh=0.02,dthresh=0.008)
##D cnptable<-rbind(cbind(aCNPmask,cnpindex=1),cbind(dCNPmask,cnpindex=-1))
##D #run the CNP test
##D myCNPtable<-applyCNPmask(segtable,"chrom",startPos="chrom.pos.start",
##D endPos="chrom.pos.end","start","end","eventIndex",masktable=cnptable,"chrom",
##D maskstart="start",maskend="end",maskindex="cnpindex",mincover=0.005,indexvals=c(-1,1))
## End(Not run)



