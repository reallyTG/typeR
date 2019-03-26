library(mefa)


### Name: as.data.frame.dist
### Title: Manipulation Tools for Class 'dist'
### Aliases: vec2dist is.dist stack.dist
### Keywords: manip

### ** Examples

vec2dist(1:3, 3)
vec2dist(1:3, 3, diag = TRUE)
vec2dist(1:3, 3, diag = TRUE, upper = TRUE)
vec2dist(1:3, 3, labels=letters[1:3])
x <- dist(1:5)
attr(x, "Labels") <- LETTERS[1:5]
x
is.dist(x)
stack(x)
stack(x, dim.names = TRUE)



