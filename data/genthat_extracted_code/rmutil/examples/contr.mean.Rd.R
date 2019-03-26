library(rmutil)


### Name: contrast
### Title: Contrast Matrix for Constraints about the Mean
### Aliases: contr.mean
### Keywords: design regression array

### ** Examples

oldop <- options(contrasts=c("contr.sum","contra.poly"))
y <- rnorm(30)
x <- gl(3,10,labels=c("First","Second","Third"))
glm(y~x)
options(contrasts=c("contr.mean","contra.poly"))
x <- gl(3,10,labels=c("First","Second","Third"))
glm(y~x)
options(oldop)



