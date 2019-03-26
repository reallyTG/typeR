library(ggenealogy)


### Name: getBranchQual
### Title: Descendant branch calculations for quantitative variable
### Aliases: getBranchQual

### ** Examples

data(statGeneal)
rExpr = "geneal$colName=='The Johns Hopkins University'"
DC_JHU = getBranchQual("David Cox", statGeneal, "school", rExpr, 15)
rExpr = "geneal$colName=='UnitedKingdom'"
DC_UK = getBranchQual("David Cox", statGeneal, "country", rExpr, 15)
rExpr = "grepl('(?i)Stochastic', geneal$colName)"
DC_Stochastic = getBranchQual("David Cox", statGeneal, "thesis", rExpr, 15)



