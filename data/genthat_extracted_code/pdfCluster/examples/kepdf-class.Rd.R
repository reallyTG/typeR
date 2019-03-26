library(pdfCluster)


### Name: kepdf-class
### Title: Class "kepdf"
### Aliases: kepdf-class show,kepdf-method summary.kepdf
### Keywords: classes nonparametric smooth

### ** Examples

#
showClass("kepdf")

#
data(wine)
#select only "Barolo"-type wines
x <- wine[1:59,3] 
pdf <- kepdf(x)
pdf
summary(pdf)
summary(pdf, props = 10*seq(1, 9, by = 1))




