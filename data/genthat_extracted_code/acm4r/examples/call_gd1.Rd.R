library(acm4r)


### Name: call_gd1
### Title: Genetic Distance 1
### Aliases: call_gd1

### ** Examples

## Don't show: 
(WD <- getwd())
if (!is.null(WD)) setwd(WD)
data(replicates.in)
write.table(replicates.in,  "replicates.in", quote=FALSE, row.names=FALSE)
data(experiments.in)
write.table(experiments.in, "experiments.in", quote=FALSE, row.names=FALSE)
call_erra("replicates.in",  dnum=1, sd=1, delete=TRUE)
res1<-call_acm("experiments.in")
## End(Don't show)
#matching by GD1
res_gd1<-call_gd1(res1)



