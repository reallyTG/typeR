### R code from vignette source 'LncPath.Rnw'

###################################################
### code chunk number 1: LncPath.Rnw:47-48
###################################################
library(LncPath)


###################################################
### code chunk number 2: LncPath.Rnw:56-69
###################################################
#obtain the expression profile data 
Profile <- getExampleData("Profile")
Profile[1:10, 1:10]

#obtain the labels of the samples of the expression profile, the label vector is a vector of 0/1s,
# 0 represents the case sample and 1 represents the control sample 
Labels <- getExampleData("Labels")
Labels[1:10]

##find differentially expressed genes, using t-Test defautly
options(stringsAsFactors = FALSE)
SigGenes <- findSigGenes(Profile, Labels, Method = "tTest", FdrCut = 0.01)
head(SigGenes)


###################################################
### code chunk number 3: LncPath.Rnw:75-98
###################################################

#get lncRNA-mRNA interaction network
NetLncPath <- getNet();
dim(NetLncPath);
print(head(NetLncPath), row.names = FALSE)

#get example lncRNA sets 
SigLncs <- getExampleData("SigLncs")
print(head(SigLncs), row.names = FALSE)

#get the example lncRNA-mRNA interaction network
ExampleNet <- getExampleData("ExampleNet")
print(head(ExampleNet), row.names = FALSE)


#evaluate the rate of pathways regulated by lncRNA sets
Result <- lncPath(SigLncs, ExampleNet,  Weighted = TRUE, PathwayDataSet = "KEGG", nperm = 100, 
minPathSize = 0, maxPathSize = 500)


## Generate a table of the summary of each pathway 
PathwaySummaryTable <- lncPath2Table(Result)
print(head(PathwaySummaryTable), row.names = FALSE)


###################################################
### code chunk number 4: LncPath.Rnw:107-109
###################################################
#get an example result data
Result <- getExampleData("Result")


###################################################
### code chunk number 5: RunningScores
###################################################
#plot the running score of the KEGG RIBOSOME pathway 
plotRunningES(Result, Name = "KEGG_RIBOSOME")


###################################################
### code chunk number 6: LncPath.Rnw:130-136
###################################################
#get an example result data
Result <- getExampleData("Result")

#get the details of genes in the KEGG_RIBOSOME pathway
Detail <- geneSetDetail(Result, Name = "KEGG_RIBOSOME")
head(Detail)


###################################################
### code chunk number 7: LncPath.Rnw:143-148
###################################################
#get an example result data
Result <- getExampleData("Result")
#get example data
Profile <- getExampleData("Profile")
Labels <- getExampleData("Labels")


###################################################
### code chunk number 8: HeatMap
###################################################
#Draw the heatmap of genes in KEGG_RIBOSOME pathway
drawAHeatMap(Result, Name = "KEGG_RIBOSOME", PCExpr = Profile, Labels = Labels)


###################################################
### code chunk number 9: sessionInfo
###################################################
sessionInfo()


