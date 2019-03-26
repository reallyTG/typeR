library(JGL)


### Name: screen.fgl
### Title: Quickly identify connected features in the solution to FGL
### Aliases: screen.fgl
### Keywords: ~kwd1 ~kwd2

### ** Examples

## load an example dataset with K=two classes, p=200 features, and n=100 samples per class:
data(example.data)
str(example.data)
## which nodes will be connected?
screen.fgl(example.data,lambda1=.2,lambda2=.1,weights="equal")




