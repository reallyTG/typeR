library(ClueR)


### Name: clustOptimal
### Title: Generate optimal clustering
### Aliases: clustOptimal

### ** Examples

# simulate a time-series data with 4 distinctive profile groups and each group with
# a size of 50 phosphorylation sites.
simuData <- temporalSimu(seed=1, groupSize=50, sdd=1, numGroups=4)

# create an artificial annotation database. Generate 20 kinase-substrate groups each
# comprising 10 substrates assigned to a kinase.
# among them, create 4 groups each contains phosphorylation sites defined to have the
# same temporal profile.
kinaseAnno <- list()
groupSize <- 50
for (i in 1:4) {
 kinaseAnno[[i]] <- paste("p", (groupSize*(i-1)+1):(groupSize*(i-1)+10), sep="_")
}

for (i in 5:20) {
 set.seed(i)
 kinaseAnno[[i]] <- paste("p", sample.int(nrow(simuData), size = 10), sep="_")
}
names(kinaseAnno) <- paste("KS", 1:20, sep="_")

# run CLUE with a repeat of 2 times and a range from 2 to 7
set.seed(1)
clueObj <- runClue(Tc=simuData, annotation=kinaseAnno, rep=5, kRange=7)

# visualize the evaluation outcome
xl <- "Number of clusters"
yl <- "Enrichment score"
boxplot(clueObj$evlMat, col=rainbow(ncol(clueObj$evlMat)), las=2, xlab=xl, ylab=yl, main="CLUE")
abline(v=(clueObj$maxK-1), col=rgb(1,0,0,.3))

# generate optimal clustering results using the optimal k determined by CLUE
best <- clustOptimal(clueObj, rep=3, mfrow=c(2, 3))

# list enriched clusters
best$enrichList

# obtain the optimal clustering object
## No test: 
  best$clustObj
## End(No test)




