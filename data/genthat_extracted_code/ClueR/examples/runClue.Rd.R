library(ClueR)


### Name: runClue
### Title: Run CLUster Evaluation
### Aliases: runClue

### ** Examples

## Example 1. Running CLUE with a simulated phosphoproteomics data

## simulate a time-series phosphoproteomics data with 4 clusters and
## each cluster with a size of 100 phosphosites
simuData <- temporalSimu(seed=1, groupSize=100, sdd=1, numGroups=4)

## create an artificial annotation database. Specifically, Generate 50
## kinase-substrate groups each comprising 20 substrates assigned to a kinase. 
## Among them, create 5 groups each contains phosphosites defined 
## to have the same temporal profile.

kinaseAnno <- list()
groupSize <- 100
for (i in 1:5) {
  kinaseAnno[[i]] <- paste("p", (groupSize*(i-1)+1):(groupSize*(i-1)+20), sep="_")
}

for (i in 6:50) {
  set.seed(i)
  kinaseAnno[[i]] <- paste("p", sample.int(nrow(simuData), size = 20), sep="_")
}
names(kinaseAnno) <- paste("KS", 1:50, sep="_")

## run CLUE with a repeat of 3 times and a range from 2 to 8
set.seed(1)
cl <- runClue(Tc=simuData, annotation=kinaseAnno, rep=3, kRange=2:8)

## visualize the evaluation outcome
boxplot(cl$evlMat, col=rainbow(8), las=2, xlab="# cluster", ylab="Enrichment", main="CLUE")

## generate optimal clustering results using the optimal k determined by CLUE
best <- clustOptimal(cl, rep=3, mfrow=c(2, 3))

## list enriched clusters
best$enrichList

## obtain the optimal clustering object
## No test: 
best$clustObj
## End(No test)

## Example 2. Running CLUE with a phosphoproteomics dataset, discover optimal number of clusters, 
## clustering data accordingly, and identify key kinases involved in each cluster.

## load the human ES phosphoprotoemics data (Rigbolt et al. Sci Signal. 4(164):rs3, 2011)
data(hES)
# load the PhosphoSitePlus annotations (Hornbeck et al. Nucleic Acids Res. 40:D261-70, 2012)
# note that one can instead use PhosphoELM database by typing "data(PhosphoELM)".
data(PhosphoSite)

## run CLUE with a repeat of 5 times and a range from 2 to 15
## No test: 
set.seed(1)
cl <- runClue(Tc=hES, annotation=PhosphoSite.human, rep=5, kRange=2:15)

boxplot(cl$evlMat, col=rainbow(15), las=2, xlab="# cluster", ylab="Enrichment", main="CLUE")

best <- clustOptimal(cl, rep=3, mfrow=c(4, 4))

best$enrichList
## End(No test)

## Example 3. Running CLUE with a gene expression dataset, discover optimal number of clusters, 
## clustering data accordingly, and identify key pathway involved in each cluster.

## load mouse adipocyte gene expression data 
# (Ma et al. Molecular and Cellular Biology. 2014, 34(19):3607-17)
data(adipocyte)

## load the KEGG annotations
## note that one can instead use reactome, GOBP, biocarta database
data(Pathways)

## select genes that are differentially expressed during adipocyte differentiation
adipocyte.selected <- adipocyte[adipocyte[,"DE"] == 1,]

## run CLUE with a repeat of 5 times and a range from 10 to 22
## No test: 
set.seed(3)
cl <- runClue(Tc=adipocyte.selected, annotation=Pathways.KEGG, rep=3, kRange=10:20)

xl <- "Number of clusters"
yl <- "Enrichment score"
boxplot(cl$evlMat, col=rainbow(ncol(cl$evlMat)), las=2, xlab=xl, ylab=yl, main="CLUE")
## End(No test)




