library(citbcmst)


### Name: cit.assignBcmst
### Title: cit.assignBcmst
### Aliases: cit.assignBcmst
### Keywords: methods

### ** Examples
load(list.files(system.file("extdata", package="citbcmst"), full.names=TRUE)[1])
# load exp.norm.bertheau07 object stored in /inst/extdata
exp.annot.bertheau07 <- data.frame(id=rownames(exp.norm.bertheau07), stringsAsFactors=FALSE,
row.names=rownames(exp.norm.bertheau07) )
citbcmst.bertheau07 <- cit.assignBcmst(    data=exp.norm.bertheau07,
                                           data.annot=exp.annot.bertheau07,
                                           data.colId="id",
                                           data.colMap="id" ,
                                           citbcmst.colMap="Probe.Set.ID",
                                           dist.method="dlda",
                                           plot=TRUE
                                 ) 


