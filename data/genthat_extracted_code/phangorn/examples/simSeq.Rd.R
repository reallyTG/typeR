library(phangorn)


### Name: simSeq
### Title: Simulate sequences.
### Aliases: simSeq simSeq.phylo simSeq.pml
### Keywords: cluster

### ** Examples


## Not run: 
##D data(Laurasiatherian)
##D tree <- nj(dist.ml(Laurasiatherian))
##D fit <- pml(tree, Laurasiatherian, k=4)
##D fit <- optim.pml(fit, optNni=TRUE, model="GTR", optGamma=TRUE)
##D data <- simSeq(fit)
## End(Not run)

tree <- rtree(5)
plot(tree)
nodelabels()

# Example for simple DNA alignment
data <- simSeq(tree, l = 10, type="DNA", bf=c(.1,.2,.3,.4), Q=1:6)
as.character(data)

# Example to simulate discrete Gamma rate variation
rates <- discrete.gamma(1,4)
data1 <- simSeq(tree, l = 100, type="AA", model="WAG", rate=rates[1])
data2 <- simSeq(tree, l = 100, type="AA", model="WAG", rate=rates[2])
data3 <- simSeq(tree, l = 100, type="AA", model="WAG", rate=rates[3])
data4 <- simSeq(tree, l = 100, type="AA", model="WAG", rate=rates[4])
data <- c(data1,data2, data3, data4)

write.phyDat(data, file="temp.dat", format="sequential", nbcol = -1, 
  colsep = "")
unlink("temp.dat") 




