## ------------------------------------------------------------------------
library(preprosim)
res <- preprosimrun(iris, fitmodels=FALSE)

## ------------------------------------------------------------------------
datasets <- res@data
length(datasets)

## ------------------------------------------------------------------------
df <- getpreprosimdf(res, c(0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1))
head(df)

## ------------------------------------------------------------------------
str(res@grid, give.attr=FALSE)

## ---- results='hide', message=FALSE, warning=FALSE, fig.width=8----------
res <- preprosimrun(iris, param=newparam(iris, "custom", x="misval", z="noise"), caretmodel="rpart", holdoutrounds = 2, verbose=FALSE)
preprosimplot(res)

## ---- results='hide', message=FALSE, warning=FALSE, fig.width=8----------
preprosimplot(res, "xz", x="misval", z="noise")

## ------------------------------------------------------------------------
data <- getpreprosimdata(res, "xz", x="misval", z="noise")
str(data)

## ---- results='hide', message=FALSE, warning=FALSE, fig.width=8----------
preprosimplot(res, "varimportance")

## ------------------------------------------------------------------------
pa <- newparam(iris)
pa1 <- newparam(iris, "empty")
pa2 <- newparam(iris, "custom", "misval", "noise")

## ------------------------------------------------------------------------
pa <- changeparam(pa, "noise", "cols", value=1)
pa <- changeparam(pa, "noise", "param", value=c(0,0.1))
pa <- changeparam(pa, "noise", "order", value=1)

## ---- results='hide', message=FALSE, warning=FALSE, fig.width=8----------
library(preproviz)
viz <- preproviz(df)
plotVARCLUST(viz)

## ---- eval=FALSE---------------------------------------------------------
#  library(preprocomb)
#  grid <- setgrid(preprodefault, df)
#  result <- preprocomb(grid)
#  result@bestclassification

