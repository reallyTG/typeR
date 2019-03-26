library(lmomco)


### Name: is.st3
### Title: Is a Distribution Parameter Object Typed as 3-Parameter Student
###   t Distribution
### Aliases: is.st3
### Keywords: utility (distribution, type check) Distribution: Student t
###   (3-parameter)

### ** Examples

para <- vec2par(c(3, 4, 5), type='st3')
if(is.st3(para)) {
  Q <- quast3(0.25,para)
}



