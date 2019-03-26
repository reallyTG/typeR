library(pairheatmap)


### Name: pairheatmap
### Title: Heatmap Comparison
### Aliases: pairheatmap
### Keywords: methods

### ** Examples

## simple demo
chvalue <- pairheatmap(mtcars, mtcars)
chvalue
pairheatmap(mtcars, mtcars, scale="row")
pairheatmap(mtcars, mtcars[,1:5], scale="row")
pairheatmap(mtcars, mtcars[,1:5], scale="rowsep")
pairheatmap(mtcars, mtcars[,1:5], scale="col")
## row group bar
pairheatmap(mtcars, mtcars,
rowGroup=mtcars$gear,
rowNameFontSize=6,
colNameFontSize=6,
rowNameGroupColor=rev(c("blue",  "green", "orange")),
rowNameColor="blue",
)
## group options
pairheatmap(mtcars, mtcars,
rowGroup=mtcars$gear,
orderRowGroup=c(5, 4,3)
)
## legend
pairheatmap(mtcars, mtcars,
legend.pos="middle", legend.percent=0.6, legend.fontsize=7)
## cluster analysis
pairheatmap(mtcars, mtcars, clusterMethod="ward", clusterRow=FALSE)
pairheatmap(mtcars,  cbind(mtcars, mtcars), clusterColTogether=TRUE)
## selected groups
pairheatmap(mtcars,  cbind(mtcars, mtcars),
groupBorder.selectList=
      list(xgroup.start=c(2,7), xgroup.end=c(4,9),
           ygroup.start=c(3,30), ygroup.end=c(10,32)
           ))
## more demo
pairheatmap(mtcars, mtcars,  legend.percent=1, legend.pos="middle",
         groupBorder.selectList=list(xgroup.start=c(2,7), xgroup.end=c(4,9), ygroup.start=c(3,30),
         ygroup.end=c(10,32)))
pairheatmap(mtcars, mtcars, scale="row", colorStyle="s3",
         groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11),
         ygroup.start=c(11), ygroup.end=c(15)),
         legend.pos="top")
pairheatmap(mtcars, mtcars,
         colorStyle="s4", rowGroup=mtcars$gear,
         rowGroupColor=TRUE,
         rowGroupColor.choice = rev(c("blue", "orange", "green")),
         groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11), ygroup.start=c(22), ygroup.end=c(25)),
         legend.pos="top", legend.percent=0.6, legend.fontsize=5, orderRowGroup=c(5, 4,3),
         clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=TRUE
         )
mtcars2 <- mtcars[, rev(1:ncol(mtcars))]
pairheatmap(mtcars, mtcars2,
         colorStyle="s1", rowGroup=mtcars$gear,
         rowGroupColor=TRUE,
         rowGroupColor.choice = rev(c("blue", "orange", "green")),
         groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11), ygroup.start=c(22), ygroup.end=c(25)),
         legend.pos="top", legend.percent=0.6, legend.fontsize=5, orderRowGroup=c(5, 4,3),
         clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=FALSE
         )
pairheatmap(mtcars, mtcars,
         dendrogram="row", colorStyle="s1", rowGroup=mtcars$am,
         rowGroupColor=TRUE,
         groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11), ygroup.start=c(22), ygroup.end=c(25)),
         legend.pos="top", legend.percent=0.6, legend.fontsize=5,
         orderRowGroup=c(0,1),
         clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=FALSE
         )



