library(JGL)


### Name: screen.ggl
### Title: Quickly identify connected features in the solution to GGL
### Aliases: screen.ggl

### ** Examples

## load an example dataset with K=two classes, p=200 features, and n=100 samples per class:
data(example.data)
str(example.data)
## which nodes will be connected?
screen.ggl(example.data,lambda1=.3,lambda2=.3,weights="equal")




