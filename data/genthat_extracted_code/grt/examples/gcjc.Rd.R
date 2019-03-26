library(grt)


### Name: gcjc
### Title: General Conjunctive Classifier
### Aliases: gcjc print.gcjc
### Keywords: multivariate

### ** Examples

data(subjdemo_cj)

m.cj <- gcjc(response ~ x1 + x2, data=subjdemo_cj, 
  config=2, category=subjdemo_cj$category, zlimit=7)




