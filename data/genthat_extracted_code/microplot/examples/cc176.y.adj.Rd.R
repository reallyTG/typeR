library(microplot)


### Name: cc176.y.adj
### Title: Adjusted response values and their five number summaries by
###   treatment level for one model using the cc176 dataset. This dataset
###   is used in two demos: "bwplot" and "boxplot-ggplot".
### Aliases: cc176.y.adj cc176fivenumsd
### Keywords: datasets

### ** Examples

## Not run: 
##D   ## This example is based on chunks 1, 2, 4, 6 of HH::HHscriptnames(13)
##D   ## It defines the data(cc176.y.adj) that is used in
##D   ##    demo("bwplot-lattice")  ## 5 calls to latex() and 5 calls to msWord()
##D   ##    demo("boxplot-ggplot")  ## 2 calls to latex() and 3 calls to msWord()
##D 
##D data(cc176, package="HH")
##D cc176.aov <- aov(wt.d ~ rep + wt.n + n.treats*minutes*current,
##D                  data=cc176)
##D cc176.y.adj <- cc176$wt.d  -
##D   (cc176$wt.n - mean(cc176$wt.n))*coef(cc176.aov)["wt.n"]
##D 
##D tmp <-
##D sapply(split(cc176.y.adj, cc176$current),
##D        function(x)
##D          c(min=min(x),
##D            "m-sd"=mean(x)-sd(x),
##D            mean=mean(x),
##D            "m+sd"=mean(x)+sd(x),
##D            max=max(x)))
##D cc176fivenumsd <- t(tmp)
##D 
##D save(cc176.y.adj, cc176fivenumsd, file="cc176.y.adj.rda")
## End(Not run)



