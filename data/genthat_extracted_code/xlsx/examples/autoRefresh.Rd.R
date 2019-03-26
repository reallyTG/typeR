library(xlsx)


### Name: ForceRefresh
### Title: Force Refresh Pivot Tables and Formulae
### Aliases: forceFormulaRefresh forcePivotTableRefresh

### ** Examples

## Not run: 
##D # Patch a file where its pivot tables are not recalculated when the file is opened
##D forcePivotTableRefresh("/tmp/file.xlsx")
##D forcePivotTableRefresh("/tmp/file.xlsx", "/tmp/fixed_file.xlsx")
##D 
##D # Patch a file where its formulae are not recalculated when the file is opened
##D forceFormulaRefresh("/tmp/file.xlsx")
##D forceFormulaRefresh("/tmp/file.xlsx", "/tmp/fixed_file.xlsx")
## End(Not run)




