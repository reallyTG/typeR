library(acm4r)


### Name: call_bablbs
### Title: BABLBS (Band Added Band Lost Band Substituted)
### Aliases: call_bablbs

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
#bablbs, GD1, and GD2 all work with the results from call_acm
#now check matching by bablbs
res_bab<-call_bablbs(res1)



