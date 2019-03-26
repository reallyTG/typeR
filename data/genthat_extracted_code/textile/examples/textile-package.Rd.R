library(textile)


### Name: textile-package
### Title: Textile Images
### Aliases: textile-package textile trainImg icImgs ocImgs
### Keywords: datasets

### ** Examples

data("trainImg")
image(1:ncol(trainImg), 1:nrow(trainImg), as.matrix(t(apply(trainImg , 2, rev))),
          col = gray((0:32)/32), xlab="", ylab="")

data("icImgs")
image(1:dim(icImgs)[1], 1:dim(icImgs)[2], as.matrix(t(apply(icImgs[,,1] , 2, rev))),
          col = gray((0:32)/32), xlab="", ylab="")

data("ocImgs")
image(1:dim(ocImgs)[1], 1:dim(ocImgs)[2], as.matrix(t(apply(ocImgs[,,1] , 2, rev))),
          col = gray((0:32)/32), xlab="", ylab="")



