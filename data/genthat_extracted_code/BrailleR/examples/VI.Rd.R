library(BrailleR)


### Name: VI
### Title: Methods to help vision impaired users
### Aliases: Describe Describe.default Describe.aov Describe.boxplot
###   Describe.dotplot Describe.histogram Describe.lm Describe.matrix
###   Describe.summary.lm Describe.tsplot Describe.TukeyHSD
###   print.description VI VI.default VI.aov VI.boxplot VI.data.frame
###   VI.dotplot VI.histogram VI.hist VI.list VI.lm VI.matrix VI.summary.lm
###   VI.tsplot VI.TukeyHSD

### ** Examples

RandomX=rnorm(500)
PlottedFig=hist(RandomX)
rm(RandomX)
VI(PlottedFig)
Describe(PlottedFig)
rm(PlottedFig)



