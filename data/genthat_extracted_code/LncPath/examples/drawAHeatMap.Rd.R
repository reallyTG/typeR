library(LncPath)


### Name: drawAHeatMap
### Title: Draw a heatmap for the genes of a pathway
### Aliases: drawAHeatMap
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

Result <- getExampleData("Result")
Profile <- getExampleData("Profile")
Labels <- getExampleData("Labels")
drawAHeatMap(Result, "KEGG_RIBOSOME", Profile, Labels)




