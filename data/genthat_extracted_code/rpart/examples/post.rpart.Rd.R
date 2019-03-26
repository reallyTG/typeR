library(rpart)


### Name: post.rpart
### Title: PostScript Presentation Plot of an Rpart Object
### Aliases: post.rpart post
### Keywords: tree

### ** Examples

z.auto <- rpart(Mileage ~ Weight, car.test.frame)
post(z.auto, file = "")   # display tree on active device
   # now construct postscript version on file "pretty.ps"
   # with no title
post(z.auto, file = "pretty.ps", title = " ")
z.hp <- rpart(Mileage ~ Weight + HP, car.test.frame)
post(z.hp)



