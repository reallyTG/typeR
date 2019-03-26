## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 5, fig.height = 5, fig.align = "center")
library(cooccurNet)

## ------------------------------------------------------------------------
logs <- changeLog(n=20)
logs

## ------------------------------------------------------------------------
dataFile=getexample(dataType="protein")
dataFile

## ------------------------------------------------------------------------
dataFile=getexample(dataType="DNA")
dataFile

## ------------------------------------------------------------------------
dataFile=getexample(dataType="SNP")
dataFile

## ------------------------------------------------------------------------
dataFile=getexample(dataType="RNA")
dataFile

## ------------------------------------------------------------------------
dataFiles=getexample_forRCOS()
dataFiles

## ------------------------------------------------------------------------
data = readseq(dataFile=getexample(dataType="protein"), dataType="protein")
data$original[1:10,1:10]
data$matrix[1:10,1:10]

## ------------------------------------------------------------------------
data = readseq(dataFile=getexample(dataType="DNA"), dataType="DNA")
data$original[1:10,1:10]
data$matrix[1:10,1:10]

## ------------------------------------------------------------------------
data = readseq(dataFile=getexample(dataType="SNP"), dataType="SNP")
data$original[1:10,1:10]
data$matrix[1:10,1:10]

## ------------------------------------------------------------------------
data = readseq(dataFile=getexample(dataType="RNA"), dataType="RNA")
data$original[1:10,1:10]
data$matrix[1:10,1:10]

## ------------------------------------------------------------------------
data = readseq(dataFile=getexample(dataType="protein"), dataType="protein")
data_process = pprocess(data=data,conservativeFilter=0.95)

## ------------------------------------------------------------------------
cooccurNetwork = gencooccur(data=data_process, cooccurFilter=0.9, networkFile='cooccurNetwork')
workspace = getwd()
workspace
readLines(cooccurNetwork$networkFile)

## ------------------------------------------------------------------------
cooccurNetwork = coocnet(dataFile=getexample(dataType="protein"), dataType="protein",conservativeFilter=0.95, cooccurFilter=0.9, networkFile='cooccurNetwork')
readLines(cooccurNetwork$networkFile)

## ------------------------------------------------------------------------
cooccurNetwork  = coocnet(dataFile=getexample(dataType="protein"), dataType="protein",conservativeFilter=0.95, cooccurFilter=0.9, module = TRUE, moduleFile='cooccurNetworkModule')
readLines(cooccurNetwork$moduleFile)

## ------------------------------------------------------------------------
cooccurNetwork  = coocnet(dataFile=getexample(dataType="protein"), dataType="protein",conservativeFilter=0.95, cooccurFilter=0.9, property = TRUE, propertyFile='cooccurNetworkProperty')
readLines(cooccurNetwork$propertyFile)[1:5]

## ------------------------------------------------------------------------
pairwiseCooccur = siteco(dataFile=getexample(dataType="protein"), dataType="protein", conservativeFilter=0.95, cooccurFilter=0.9, siteCoFile='siteCooccurr', sampleTimes=10)
readLines(pairwiseCooccur$siteCoFile)[1:5]

## ------------------------------------------------------------------------
cooccurNetwork  = coocnet(dataFile=getexample(dataType="protein"), dataType="protein",conservativeFilter=0.95, cooccurFilter=0.9, networkFile='cooccurNetwork', module = TRUE, moduleFile='cooccurNetworkModule', property = TRUE, propertyFile='cooccurNetworkProperty', siteCo=TRUE, siteCoFile='siteCooccurr', sampleTimes=10 )
readLines(cooccurNetwork$networkFile)
readLines(cooccurNetwork$moduleFile)
readLines(cooccurNetwork$propertyFile)
readLines(cooccurNetwork$siteCoFile)[1:5]

## ------------------------------------------------------------------------
cooccurNetwork = coocnet(dataFile=getexample(dataType="protein"),dataType="protein")
network_igraph = toigraph(networkFile=cooccurNetwork$networkFile, networkName=c("EPI823725"))
plot(network_igraph[[1]])

## ------------------------------------------------------------------------
cooccurNetwork = coocnet(dataFile=getexample(dataType="protein"),dataType="protein")
network_igraph = toigraph(networkFile=cooccurNetwork$networkFile, networkName=cooccurNetwork$xnames)
plot(network_igraph[[2]])  

## ------------------------------------------------------------------------
workspace = getwd()
cooccurNetwork = coocnet(dataFile=getexample(dataType="protein"),dataType="protein")
network_igraph = toigraph(networkFile=cooccurNetwork$networkFile, networkName=cooccurNetwork$xnames)
#save as PDF
pdf(file="sample1.pdf")
plot(network_igraph[[1]])  
dev.off()
#save as jpeg
jpeg(file="sample1.jpeg")
plot(network_igraph[[2]])  
dev.off()
workspace

## ------------------------------------------------------------------------
cooccurNetwork  = coocnet(dataFile=getexample(dataType="protein"), dataType="protein",conservativeFilter=0.95, cooccurFilter=0.9, networkFile='cooccurNetwork', memory='sparse')

## ------------------------------------------------------------------------
data = readseq(dataFile=getexample(dataType="protein"), dataType="protein",debug=TRUE)

