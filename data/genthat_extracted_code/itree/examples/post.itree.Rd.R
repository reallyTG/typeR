library(itree)


### Name: post.itree
### Title: PostScript Presentation Plot of an itree Object
### Aliases: post.itree post
### Keywords: tree

### ** Examples

#the rpart examples:
z.auto <- itree(Mileage ~ Weight, car.test.frame)
post(z.auto, file = "")   # display tree on active device
   # now construct postscript version on file "pretty.ps"
   # with no title
post(z.auto, file = "pretty.ps", title = " ")
z.hp <- itree(Mileage ~ Weight + HP, car.test.frame)
post(z.hp)



