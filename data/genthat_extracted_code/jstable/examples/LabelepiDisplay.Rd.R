library(jstable)


### Name: LabelepiDisplay
### Title: LabelepiDisplay: Apply label information to epiDisplay object
###   using label data
### Aliases: LabelepiDisplay

### ** Examples

 fit <- glm(Sepal.Length ~ Sepal.Width + Species, data = iris)
 fit.table <- glmshow.display(fit)
 iris.label <- mk.lev(iris)
 LabelepiDisplay(fit.table, label = TRUE, ref = iris.label)



