library(acm4r)


### Name: call_erra
### Title: Error Analysis for 1D Electrophoresis Gels
### Aliases: call_erra

### ** Examples

## Don't show: 
(WD <- getwd())
if (!is.null(WD)) setwd(WD)
data(replicates.in)
write.table(replicates.in,  "replicates.in", quote=FALSE, row.names=FALSE)
## End(Don't show)
#generate the error parameter file needed by call_acm
call_erra("replicates.in",  dnum=1, sd=1, delete=TRUE)



