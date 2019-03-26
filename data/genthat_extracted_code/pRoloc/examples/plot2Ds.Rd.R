library(pRoloc)


### Name: plot2Ds
### Title: Draw 2 data sets on one PCA plot
### Aliases: plot2Ds data1 data2 col1 col2

### ** Examples

library("pRolocdata")
data(tan2009r1)
data(tan2009r2)
msnl <- MSnSetList(list(tan2009r1, tan2009r2))
plot2Ds(msnl)
## tweaking the parameters
plot2Ds(list(tan2009r1, tan2009r2),
        fcol = NULL, cex.x = 1.5)
## input is 1 MSnSet containing 2 data sets
data(dunkley2006)
plot2Ds(dunkley2006, pcol = "replicate")
## no plot, just the data
res <- plot2Ds(dunkley2006, pcol = "replicate",
               plot = FALSE)
res
head(data1(res))
head(col1(res))



