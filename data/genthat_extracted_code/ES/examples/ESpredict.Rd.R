library(ES)


### Name: ESpredict
### Title: ESpredict
### Aliases: ESpredict
### Keywords: ES

### ** Examples

data(marks)
attach(marks)
object <- ES(marks)
ESpredict(object,c=object$c1)
detach(marks)



