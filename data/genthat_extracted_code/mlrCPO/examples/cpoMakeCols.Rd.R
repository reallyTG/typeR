library(mlrCPO)


### Name: cpoMakeCols
### Title: Create Columns from Expressions
### Aliases: cpoMakeCols cpoAddCols

### ** Examples

res = pid.task %>>% cpoAddCols(gpi = glucose * pressure * insulin, pm = pregnant * mass)
head(getTaskData(res))



