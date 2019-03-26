library(CNprep)


### Name: CNpreprocessing
### Title: Pre-process DNA copy number (CN) data for detection of CN
###   events.
### Aliases: CNpreprocessing

### ** Examples

data(segexample)
data(ratexample)
data(normsegs)
#small toy example
segtable<-CNpreprocessing(segall=segexample[segexample[,"ID"]=="WZ1",],
ratall=ratexample,"ID","start","end",chromcol="chrom",bpstartcol="chrom.pos.start",
bpendcol="chrom.pos.end",blsize=50,minjoin=0.25,cweight=0.4,bstimes=50,
chromrange=1:3,distrib="Rparallel",njobs=2,modelNames="E",
normalength=normsegs[,1],normalmedian=normsegs[,2])
## Not run: 
##D #Example 1: 5 whole genome analysis, choosing the right format of arguments
##D segtable<-CNpreprocessing(segall=segexample,ratall=ratexample,"ID","start","end",
##D chromcol="chrom",bpstartcol="chrom.pos.start",bpendcol="chrom.pos.end",blsize=50,
##D minjoin=0.25,cweight=0.4,bstimes=50,chromrange=1:22,distrib="Rparallel",njobs=40,
##D modelNames="E",normalength=normsegs[,1],normalmedian=normsegs[,2])
##D #Example 2: how to use annotexample, when segment table does not have columns of 
##D #integer postions in terms of  measuring units(probes), such as "mysegs" below
##D mysegs<-segexample[,c(1,5:12)]
##D data(annotexample)
##D segtable<-CNpreprocessing(segall=mysegs,ratall=ratexample,"ID",chromcol="chrom",
##D bpstartcol="chrom.pos.start",bpendcol="chrom.pos.end",annot=annotexample,
##D annotstartcol="CHROM.POS",annotendcol="CHROM.POS",annotchromcol="CHROM",
##D blsize=50,minjoin=0.25,cweight=0.4,bstimes=50,chromrange=1:22,distrib="Rparallel",
##D njobs=40,modelNames="E",normalength=normsegs[,1],normalmedian=normsegs[,2])
## End(Not run)



