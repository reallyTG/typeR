### R code from vignette source 'MiRSEA.Rnw'

###################################################
### code chunk number 1: MiRSEA.Rnw:45-46
###################################################
library(MiRSEA)


###################################################
### code chunk number 2: MiRSEA.Rnw:58-73
###################################################
#getting KEGG pathway and human miRNAs Correlation profile(pmSET)
#and getting a weighting matrix of human miRNAs
p22m<-Corrp2miRfile(pathway="kegg",species="example")
#getting a weighting matrix of human miRNAs 
p_value<-p22m$p
p_value[1,1:15]
#getting the column names of matrix(miRNA names)
miRnames<-colnames(p_value)
miRnames[1:10]
#getting the row names of matrix(pathway names)
pathway.names<-rownames(p_value)
pathway.names[1:2]
#getting the set of regulating miRNAs of each pathway(pmSET)
p2miR<-p22m$p2miR
p2miR[1,1:5]


###################################################
### code chunk number 3: MiRSEA.Rnw:93-106
###################################################

#input example expression dataset
A<-matrix(runif(200),10,20)
##input a class.labels("0" or "1") of the expression dataset
a1<-rep(0,20)
a1[sample(1:20,5)]=1
a1<-sort(a1,decreasing=FALSE)
#Calculate the differential expression score for miRNAs
M1<-S2N(A, class.labels=a1, miR.labels=seq(1,10), nperm=100)
#print the top five observed results to screen
M1$obs.s2n.matrix[1:5,1] 
#print the top five permutations results to screen
M1$s2n.matrix[1:5,1:5] 


###################################################
### code chunk number 4: MiRSEA.Rnw:116-141
###################################################
#input example expression dataset
#input.ds <- readLines("F:/lsy/xin data/GSE36915.gct")
input.ds <- GetExampleData("dataset")
##input a class.labels of the expression dataset
#input.cls <- readLines("F:/lsy/xin data/GSE36915.cls")
input.cls <- GetExampleData("class.labels")

#get example of p value matrix
#p_value<-p22m$p
p_value <- GetExampleData("p_value")
#get example of correlation profile
#p2miR<-p22m$p2miR
p2miR <- GetExampleData("p2miR")
#identify dysregulated pathways by using the function MirSEA
MirSEAresult <- MirSEA(input.ds,input.cls,p_value,p2miR,
reshuffling.type = "miR.labels", nperm = 100, 
weighted.score.type = 1, ms.size.threshold.min = 10, 
ms.size.threshold.max = 500)

#print the summary results of up-regulated pathways to screen
summaryResult1<-MirSEAresult$report.phen1
summaryResult1[1:5,]
#print the summary results of down-regulated pathways to screen
summaryResult2<-MirSEAresult$report.phen2
summaryResult2[1:5,]


###################################################
### code chunk number 5: MiRSEA.Rnw:162-187
###################################################
#get example data
#input.ds <- readLines("F:/lsy/xin data/GSE36915.gct")
#input.cls <- readLines("F:/lsy/xin data/GSE36915.cls")
input.ds <- GetExampleData("dataset")
input.cls <- GetExampleData("class.labels")

#get example of p value matrix
p_value <- GetExampleData("p_value")
#get example of correlation profile
p2miR <- GetExampleData("p2miR")

#get a report of miRNA set for KEGG ERBB pathway
Results<-MsReport(MsNAME = "KEGG_ERBB_SIGNALING_PATHWAY", input.ds, input.cls,p_value,p2miR)
# show the report of top five miRNA in the pathway
Results[[1]][1:5,]
miR.report<-Results[[1]]

##write the results to tab delimited file.
write.table(miR.report,file="miR.report.txt",sep="\t",row.names=FALSE)
#write the detail results of miRNAs for drawing results
for(i in 1:length(Results[[2]])){ 
miRList<-Results[[2]][[i]]
filename <- paste("miRPlots",".txt", sep="", collapse="")
write.table(miRList, file = filename, quote=F, row.names=F,col.names=F, sep = "\t",append=T)
}


###################################################
### code chunk number 6: MiRSEA.Rnw:195-206
###################################################
#get example data
#input.ds <- readLines("F:/lsy/xin data/GSE36915.gct")
#input.cls <- readLines("F:/lsy/xin data/GSE36915.cls")
input.ds <- GetExampleData("dataset")
input.cls <- GetExampleData("class.labels")
 
#get a list of miRNA list result
#Results<-MsReport(MsNAME="KEGG_ERBB_SIGNALING_PATHWAY", input.ds, input.cls,
#weighted.score.type = 1)
#miRlist<-Results[[2]]
miRlist<-GetExampleData("miRList")


###################################################
### code chunk number 7: GlobmiRCorProfile
###################################################
#plot global miRNA correlation profile
PlotCorrelation(miRlist)


###################################################
### code chunk number 8: MiRSEA.Rnw:228-238
###################################################
#get example data
#
input.ds <- GetExampleData("dataset")
input.cls <- GetExampleData("class.labels")
 
#get a list of miRNA list result
#Results<-MsReport(MsNAME="KEGG_ERBB_SIGNALING_PATHWAY", input.ds, input.cls,
#weighted.score.type = 1)
#miRlist<-Results[[2]]
miRlist<-GetExampleData("miRList")


###################################################
### code chunk number 9: RunmiREScore
###################################################
#Plot running miRNAs enrichment score for the pathway result
PlotRunEnrichment(miRlist)


###################################################
### code chunk number 10: MiRSEA.Rnw:259-268
###################################################
#get example data
input.ds <- GetExampleData("dataset")
input.cls <- GetExampleData("class.labels")
 
#get a list of miRNA list result
#Results<-MsReport(MsNAME="KEGG_ERBB_SIGNALING_PATHWAY", input.ds, input.cls,
# weighted.score.type = 1)
#miRlist<-Results[[2]]
miRlist<-GetExampleData("miRList")


###################################################
### code chunk number 11: HeatMapPlot
###################################################
#Plot a heat map for a miRNA set which co-regulate pathway
PlotHeatMap(miRlist,input.ds,input.cls)


###################################################
### code chunk number 12: MiRSEA.Rnw:288-290
###################################################
##data in environment variable envData
ls(envData)


###################################################
### code chunk number 13: sessionInfo
###################################################
sessionInfo()


