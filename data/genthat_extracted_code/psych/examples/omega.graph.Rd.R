library(psych)


### Name: omega.graph
### Title: Graph hierarchical factor structures
### Aliases: omega.diagram omega.graph
### Keywords: multivariate

### ** Examples

#24 mental tests from Holzinger-Swineford-Harman
if(require(GPArotation) ) {om24 <- omega(Harman74.cor$cov,4) } #run omega

#
#example hierarchical structure from Jensen and Weng
if(require(GPArotation) ) {jen.omega <- omega(make.hierarchical())}





