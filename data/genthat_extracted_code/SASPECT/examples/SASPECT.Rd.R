library(SASPECT)


### Name: SASPECT
### Title: Significant AnalysiS of PEptide CounTs
### Aliases: SASPECT
### Keywords: methods

### ** Examples


library(SASPECT)
data(mouseTissue)

SASPECT.result<-SASPECT(peptideData=mouseTissue$peptideData, 
        pep.set=mouseTissue$pep.set, 
        pep.pro.name=mouseTissue$pep.pro.name, 
        run.group.info=mouseTissue$run.group.info,
        permu.iter=50,
        filter.run=2,
        filter.score=0.95)
### it takes about 1 minute to run this example. 

### check the qvalue distribution
qvalue=as.numeric(SASPECT.result[,"Qvalue"])
plot(sort(qvalue))
     
### output the result into a table file
write.table(SASPECT.result, file="SASPECT.result.txt", row.names=FALSE, sep="\t")
     



