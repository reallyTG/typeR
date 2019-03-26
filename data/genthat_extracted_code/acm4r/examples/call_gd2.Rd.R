library(acm4r)


### Name: call_gd2
### Title: Genetic Distance 2
### Aliases: call_gd2

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
#matching by GD2
res_gd2<-call_gd2(res1)



