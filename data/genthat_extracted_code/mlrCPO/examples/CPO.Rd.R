library(mlrCPO)


### Name: CPO
### Title: Composable Preprocessing Operators
### Aliases: CPO

### ** Examples

class(cpoPca())  # c("CPOPrimitive", "CPO")
class(cpoPca() %>>% cpoScale())  # c("CPOPipeline", "CPO")
print(cpoPca() %>>% cpoScale(), verbose = TRUE)

getHyperPars(cpoScale(center = FALSE))

head(getTaskData(iris.task %>>% cpoScale()))



