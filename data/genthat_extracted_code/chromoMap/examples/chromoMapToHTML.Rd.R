library(chromoMap)


### Name: chromoMapToHTML
### Title: convert chromoMap plots into customizable HTML documents
### Aliases: chromoMapToHTML

### ** Examples


library(chromoMap)
data("pancandata")
chmap = chromoMap(pancandata$data2,type="heatmap-double")

#saving plot to HTML document
#for desription
my_desc = "you can write a paragraph to describe your plot"
chromoMapToHTML(chmap,title = "Expression profile Comparison in normal vs tumor",
description = my_desc,openAfterSave = TRUE,dir=tempdir())







