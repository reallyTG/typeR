library(questionr)


### Name: quant.cut
### Title: Transform a quantitative variable into a qualitative variable
### Aliases: quant.cut

### ** Examples

data(iris)
sepal.width3cl <- quant.cut(iris$Sepal.Width,3)
table(sepal.width3cl)



