## ---- include=TRUE-------------------------------------------------------
library(ProliferativeIndex)

## ---- include=TRUE-------------------------------------------------------
data(vstTCGA_ACCData_sub)

#Examine only the first few columns and rows because the dataset is large (20501 genes x 10 samples):
dim(vstTCGA_ACCData_sub)
#Note that sample IDs are column names and HGNC gene IDs (http://www.genenames.org) are rownames and that vst data is numeric.
str(vstTCGA_ACCData_sub)
knitr::kable(vstTCGA_ACCData_sub[1:5,1:5])

## ---- include=TRUE-------------------------------------------------------
#Inputs are the user's vst dataframe and a model of interest for examining PI:
exampleTCGAData<-readDataForPI(vstTCGA_ACCData_sub, c("AIFM3", "ATP9B", "CTRC", "MCL1", "MGAT4B", "ODF2L", "SNORA65", "TPPP2"))

#examine output which is a list of two objects:
# exampleTCGAData$vstData is the user's vst dataframe and exampleTCGAData$modelIDs is a character string of the user's gene IDs for their model of interest
str(exampleTCGAData)

## ---- include=TRUE-------------------------------------------------------
proliferativeIndices<-calculatePI(exampleTCGAData)
summary(proliferativeIndices)

## ---- echo=FALSE, results='asis'-----------------------------------------
comparePI(proliferativeIndices)

## ---- include=TRUE-------------------------------------------------------
modelComparison<-compareModeltoPI(exampleTCGAData, proliferativeIndices)
#the output is a table, inspect:
knitr::kable(modelComparison)

