library(lavaSearch2)


### Name: initVarLink
### Title: Normalize var1 and var2
### Aliases: initVarLink initVarLinks

### ** Examples

initVarLink(y ~ x1)
initVarLink("y ~ x1")
initVarLink(y ~ x1 + x2)
initVarLink("y ~ x1 + x2")
initVarLink(y ~ x1 + x2, rep.var1 = TRUE)
initVarLink(y ~ x1 + x2, rep.var1 = TRUE, format = "formula")
initVarLink(y ~ x1 + x2, rep.var1 = TRUE, format = "txt.formula")
initVarLink("y", "x1", format = "formula")

initVarLink("y ~ x1:0|1")

initVarLinks(y ~ x1)
initVarLinks("y ~ x1")
initVarLinks(c("y ~ x1","y~ x2"))
initVarLinks(c(y ~ x1,y ~ x2))
initVarLinks(c("y ~ x1","y ~ x2"), format = "formula")
initVarLinks(c(y ~ x1,y ~ x2), format = "formula")
initVarLinks(c("y ~ x1","y~ x2"), format = "txt.formula")
initVarLinks(c(y ~ x1,y ~ x2), format = "txt.formula")



