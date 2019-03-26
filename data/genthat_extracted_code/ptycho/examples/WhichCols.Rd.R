library(ptycho)


### Name: WhichCols
### Title: Identify Columns Containing Indicator Variables
### Aliases: WhichCols indicVarCols indicGrpCols

### ** Examples

data(ptychoOut)
colnames(ptychoOut)[indicVarCols(ptychoOut)]
# Can also apply these functions to output of meanIndicators ...
mi <- meanIndicators(ptychoOut)
mi[indicGrpCols(mi)]
# ... instead of using meanGrpIndicators or meanVarIndicators
meanGrpIndicators(ptychoOut)



