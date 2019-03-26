library(KANT)


### Name: expression_up
### Title: Identify and sort genes overexpressed in one condition agains
###   another in an affymetrix dataset or a matrix of data (genes per row,
###   samples per column)
### Aliases: expression_up

### ** Examples



library(Biobase)
library(affy)
data(sample.ExpressionSet)
TEST=which(pData(sample.ExpressionSet)[,"type"]=="Case")
CTRL=which(pData(sample.ExpressionSet)[,"type"]=="Control")
data_up=expression_up(sample.ExpressionSet,type="eset",TEST,CTRL,0.5)



