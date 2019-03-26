library(spray)


### Name: subs
### Title: Substitute values into a spray object
### Aliases: subs substitute
### Keywords: symbolmath

### ** Examples


S <- spray(matrix(sample(0:3,60,replace=TRUE),nrow=12))

subs(S,c(2,5),1:2)

subs(homog(3,3),1,3)



