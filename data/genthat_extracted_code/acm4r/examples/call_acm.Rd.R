library(acm4r)


### Name: call_acm
### Title: Align-and-Count Method comparisons of RFLP data
### Aliases: call_acm

### ** Examples

## Don't show: 
(WD <- getwd())
if (!is.null(WD)) setwd(WD)
data(replicates.in)
write.table(replicates.in,  "replicates.in", quote=FALSE, row.names=FALSE)
data(experiments.in)
write.table(experiments.in, "experiments.in", quote=FALSE, row.names=FALSE)
call_erra("replicates.in",  dnum=1, sd=1, delete=TRUE)
## End(Don't show)
#perform the basic pairwise comparison via the align and count algorithm
res1<-call_acm("experiments.in")



