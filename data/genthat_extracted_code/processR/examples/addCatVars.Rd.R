library(processR)


### Name: addCatVars
### Title: Add dummy vars to data.frame
### Aliases: addCatVars

### ** Examples

mtcars1=addCatVars(mtcars,c("cyl","carb"))
mtcars1[c(3:5),]
mtcars2=addCatVars(mtcars,c("cyl","carb"),mode=3)
mtcars2[c(3:5),]
protest1=addCatVars(protest,"protest")
head(protest1)
iris1=addCatVars(iris,c("Species"),mode=3)
(iris1[c(1,51,101),])



