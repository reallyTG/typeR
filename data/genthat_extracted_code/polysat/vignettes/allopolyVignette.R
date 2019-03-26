### R code from vignette source 'allopolyVignette.Rnw'

###################################################
### code chunk number 1: allopolyVignette.Rnw:129-134
###################################################
library(polysat)
data(AllopolyTutorialData)
summary(AllopolyTutorialData)
# make a copy of the dataset to modify
mydata <- AllopolyTutorialData


###################################################
### code chunk number 2: allopolyVignette.Rnw:151-161
###################################################
# Calculate the length of each genotype vector (= the number of alleles) and
# construct a TRUE/FALSE matrix of whether that number is greater than four.
tooManyAlleles <- apply(Genotypes(mydata), c(1,2), 
                        function(x) length(x[[1]])) > 4
# Find position(s) in the matrix that are TRUE.
which(tooManyAlleles, arr.ind=TRUE) # 43rd sample, second locus
# Look at the identified genotype, then replace it with missing data.
Genotype(mydata, 43, 2)
Genotype(mydata, 43, 2) <- Missing(mydata)
Genotype(mydata, 43, 2)


###################################################
### code chunk number 3: allopolyVignette.Rnw:168-170 (eval = FALSE)
###################################################
## mydist <- meandistance.matrix(mydata, distmetric=Lynch.distance,
##                               progress=FALSE)


###################################################
### code chunk number 4: allopolyVignette.Rnw:173-174
###################################################
load("vignettebuild/AllopolyTutorialDist.RData")


###################################################
### code chunk number 5: allopolyVignette.Rnw:177-180
###################################################
require(ape)
mynj <- nj(mydist)
plot(mynj, type="unrooted")


###################################################
### code chunk number 6: allopolyVignette.Rnw:190-191
###################################################
mydata <- deleteSamples(mydata, c("301","302","303"))


###################################################
### code chunk number 7: allopolyVignette.Rnw:197-201
###################################################
par(mfrow=c(2,1))
mypca <- cmdscale(mydist[Samples(mydata), Samples(mydata)])
plot(mypca[,1], mypca[,2])
hist(mypca[,1], breaks=30)


###################################################
### code chunk number 8: allopolyVignette.Rnw:210-214
###################################################
pop1ind <- Samples(mydata)[mypca[,1] <= 0]
pop2ind <- Samples(mydata)[mypca[,1] > 0]
PopInfo(mydata)[pop1ind] <- 1
PopInfo(mydata)[pop2ind] <- 2


###################################################
### code chunk number 9: allopolyVignette.Rnw:274-276 (eval = FALSE)
###################################################
## myassign <- processDatasetAllo(mydata, n.subgen = 2, SGploidy = 2, 
##                                usePops = TRUE, R = 500)


###################################################
### code chunk number 10: allopolyVignette.Rnw:279-280
###################################################
load("vignettebuild/AllopolyTutorialAssign.RData")


###################################################
### code chunk number 11: allopolyVignette.Rnw:298-300
###################################################
myassign$AlCorrArray[["Loc6", 1]]$significant.pos
myassign$AlCorrArray[["Loc6", 2]]$significant.pos


###################################################
### code chunk number 12: allopolyVignette.Rnw:310-311
###################################################
mydata <- deleteLoci(mydata, loci="Loc6")


###################################################
### code chunk number 13: allopolyVignette.Rnw:327-329
###################################################
par(mfrow = c(1,1))
plotSSAllo(myassign$AlCorrArray)


###################################################
### code chunk number 14: allopolyVignette.Rnw:356-358
###################################################
heatmap(myassign$AlCorrArray[["Loc5", "Pop1"]]$heatmap.dist,
        main = "Loc5, Pop1")


###################################################
### code chunk number 15: allopolyVignette.Rnw:363-371
###################################################
# A plot to show how the colors correspond to p-values in the
# heat map; you can repeat this for the other heat maps in this
# tutorial if you wish.
plot(x=seq(min(myassign$AlCorrArray[["Loc5", "Pop1"]]$heatmap.dist),
           max(myassign$AlCorrArray[["Loc5", "Pop1"]]$heatmap.dist), 
           length.out=12),
     y=rep(1,12), xlab="P-values", ylab="", bg=heat.colors(12), 
     pch=22, cex=3)


###################################################
### code chunk number 16: allopolyVignette.Rnw:373-375
###################################################
heatmap(myassign$AlCorrArray[["Loc6", "Pop1"]]$heatmap.dist,
        main = "Loc6, Pop1")


###################################################
### code chunk number 17: allopolyVignette.Rnw:380-382
###################################################
heatmap(myassign$AlCorrArray[["Loc7", "Pop1"]]$heatmap.dist,
        main = "Loc7, Pop1")


###################################################
### code chunk number 18: allopolyVignette.Rnw:384-386
###################################################
heatmap(myassign$AlCorrArray[["Loc7", "Pop2"]]$heatmap.dist,
        main = "Loc7, Pop2")


###################################################
### code chunk number 19: allopolyVignette.Rnw:410-412
###################################################
plotParamHeatmap(myassign$propHomoplasious, popname = "Pop1", 
                 main = "Proportion homoplasious loci:")


###################################################
### code chunk number 20: allopolyVignette.Rnw:423-425
###################################################
plotParamHeatmap(myassign$propHomoplasious, popname = "Pop2", 
                 main = "Proportion homoplasious loci:")


###################################################
### code chunk number 21: allopolyVignette.Rnw:437-439
###################################################
plotParamHeatmap(myassign$propHomoplMerged, popname = "Merged across populations", 
                 main = "Proportion homoplasious loci:")


###################################################
### code chunk number 22: allopolyVignette.Rnw:461-463
###################################################
plotParamHeatmap(myassign$missRate, popname = "All Individuals", 
                 main = "Missing data after recoding:")


###################################################
### code chunk number 23: allopolyVignette.Rnw:481-484
###################################################
myBestAssign <- myassign$bestAssign
myBestAssign
myBestAssign <- myBestAssign[1:5]


###################################################
### code chunk number 24: allopolyVignette.Rnw:496-497
###################################################
apply(myassign$missRate, 1, min)


###################################################
### code chunk number 25: allopolyVignette.Rnw:507-511
###################################################
myassign$AlCorrArray[["Loc1", "Pop1"]]$Kmeans.groups
myassign$AlCorrArray[["Loc1", "Pop2"]]$Kmeans.groups
myassign$AlCorrArray[["Loc1", "Pop1"]]$UPGMA.groups
myassign$AlCorrArray[["Loc1", "Pop2"]]$UPGMA.groups


###################################################
### code chunk number 26: allopolyVignette.Rnw:520-532
###################################################
myassign$TAGarray[["Loc1", "Pop1", 1]]$assignments
myassign$TAGarray[["Loc1", "Pop2", 1]]$assignments
myassign$mergedAssignments[["Loc1", 1]]$assignments
myassign$TAGarray[["Loc1", "Pop1", 2]]$assignments
myassign$TAGarray[["Loc1", "Pop2", 2]]$assignments
myassign$mergedAssignments[["Loc1", 2]]$assignments
myassign$TAGarray[["Loc1", "Pop1", 3]]$assignments
myassign$TAGarray[["Loc1", "Pop2", 3]]$assignments
myassign$mergedAssignments[["Loc1", 3]]$assignments
myassign$TAGarray[["Loc1", "Pop1", 4]]$assignments
myassign$TAGarray[["Loc1", "Pop2", 4]]$assignments
myassign$mergedAssignments[["Loc1", 4]]$assignments


###################################################
### code chunk number 27: allopolyVignette.Rnw:551-554
###################################################
corrLoc1AllInd <- alleleCorrelations(mydata, locus = "Loc1", n.subgen = 2)
corrLoc1AllInd$Kmeans.groups
corrLoc1AllInd$UPGMA.groups


###################################################
### code chunk number 28: allopolyVignette.Rnw:565-573
###################################################
TaLoc1.param2 <- testAlGroups(mydata, corrLoc1AllInd, SGploidy = 2,
                              null.weight = 0.5, tolerance = 0.05, 
                              swap = FALSE)
TaLoc1.param5 <- testAlGroups(mydata, corrLoc1AllInd, SGploidy = 2,
                              null.weight = 0.5, tolerance = 0.1, 
                              swap = FALSE)
TaLoc1.param2$assignments
TaLoc1.param5$assignments


###################################################
### code chunk number 29: allopolyVignette.Rnw:581-582
###################################################
myBestAssign[[1]] <- TaLoc1.param5


###################################################
### code chunk number 30: allopolyVignette.Rnw:590-592
###################################################
recodedData <- recodeAllopoly(mydata, myBestAssign)
summary(recodedData)


###################################################
### code chunk number 31: allopolyVignette.Rnw:600-604
###################################################
for(L in Loci(recodedData)){
  proportionmissing <- mean(isMissing(recodedData, loci=L))
  cat(paste(L,":",proportionmissing,"missing"),sep="\n")
}


###################################################
### code chunk number 32: allopolyVignette.Rnw:612-613
###################################################
table(Ploidies(recodedData))


###################################################
### code chunk number 33: allopolyVignette.Rnw:618-619
###################################################
Ploidies(recodedData)[,"Loc7"] <- 4


###################################################
### code chunk number 34: allopolyVignette.Rnw:627-630
###################################################
myfreq <- simpleFreq(recodedData)
myGst <- calcPopDiff(myfreq, metric = "Gst")
myGst


###################################################
### code chunk number 35: allopolyVignette.Rnw:635-636
###################################################
write.GeneMapper(recodedData, file = "tutorialRecodedData.txt")


###################################################
### code chunk number 36: allopolyVignette.Rnw:648-656
###################################################
catResults <- list()
length(catResults) <- length(Loci(mydata))
names(catResults) <- Loci(mydata)

for(L in Loci(mydata)){
  cat(L, sep="\n")
  catResults[[L]] <- catalanAlleles(mydata, locus=L, verbose=TRUE)
}


