library(highfrequency)


### Name: tradesCleanupFinal
### Title: Perform a final cleaning procedure on trade data
### Aliases: tradesCleanupFinal
### Keywords: cleaning

### ** Examples

#Consider you have raw trade data for 1 stock for 1 day 
#data("sample_qdata");    #load cleaned quote data
#data("sample_tdataraw"); #load raw trade data
#tdata_afterfirstcleaning = tradesCleanup(tdataraw=sample_tdataraw,
#exchange="N",report=FALSE);
#dim(tdata_afterfirstcleaning);
#tdata_afterfinalcleaning = tradesCleanupFinal(qdata=sample_qdata,
#tdata=tdata_afterfirstcleaning);
#dim(tdata_afterfinalcleaning);
#In case you have more data it is advised to use the on-disk functionality
#via "from","to","datasource",etc. arguments



