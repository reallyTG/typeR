library(arules)


### Name: affinity
### Title: Computing Affinity Between Items
### Aliases: affinity affinity,itemMatrix-method affinity,matrix-method
### Keywords: cluster models

### ** Examples

data("Adult")

## choose a sample, calculate affinities 
s <- sample(Adult, 500)
s

a <- affinity(s)
image(a)



