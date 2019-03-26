library(denoiseR)


### Name: tumors
### Title: Brain tumors data.
### Aliases: tumors
### Keywords: datasets

### ** Examples

data(tumors)
## Not run: 
##D res.ada <- adashrink(tumors[, -ncol(tumors)], method = "SURE")
##D res.hcpc <- HCPC(as.data.frame(res.ada$mu.hat), graph=F, consol = FALSE)
##D plot.HCPC(res.hcpc, choice = "map", draw.tree = "FALSE")
## End(Not run)



