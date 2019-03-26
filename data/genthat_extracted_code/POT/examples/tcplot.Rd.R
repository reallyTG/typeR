library(POT)


### Name: tcplot
### Title: Threshold Selection: The Threshold Choice Plot
### Aliases: tcplot
### Keywords: hplot

### ** Examples

data(ardieres)
ardieres <- clust(ardieres, 4, 10 / 365, clust.max = TRUE)
flows <- ardieres[, "obs"]
par(mfrow=c(1,2))
tcplot(flows, u.range = c(0, 15) )



