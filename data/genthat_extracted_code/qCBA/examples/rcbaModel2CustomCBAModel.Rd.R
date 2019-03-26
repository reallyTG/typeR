library(qCBA)


### Name: rcbaModel2CustomCBAModel
### Title: rcbaModel2CustomCBAModel Converts a model created by 'rCBA' so
###   that it can be passed to qCBA
### Aliases: rcbaModel2CustomCBAModel

### ** Examples

## No test: 
 # this example takes about 10 seconds
if (! requireNamespace("rCBA", quietly = TRUE)) {
 message("Please install rCBA: install.packages('rCBA')")
} else
{
 library(rCBA)
 message(packageVersion("rCBA"))
 discrModel <- discrNumeric(iris, "Species")
 irisDisc <- as.data.frame(lapply(discrModel$Disc.data, as.factor))
 rCBAmodel <- rCBA::build(irisDisc)
 cCBAmodel <- rcbaModel2CustomCBAModel(rCBAmodel,discrModel$cutp,"Species",iris)
 qCBAmodel <- qcba(cCBAmodel,iris)
 print(qCBAmodel@rules)
  }
## End(No test)




