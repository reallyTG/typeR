library(vocaldia)


### Name: printARFFfile
### Title: printARFFfile: Create arff files by creating and flattening
###   vocaldias
### Aliases: printARFFfile

### ** Examples

data(vocdia)
atdarff <- tempfile(pattern='vocaldia-', fileext='arff')
printARFFfile(atddia, individual=TRUE, classcolumn='dx',
              file=atdarff, noPauseTypes=FALSE)
library("foreign")
x1 <- read.arff(atdarff)
x1[1:3,]
## remove empty columns
x1[,c(unlist(apply(x1[1:(ncol(x1)-1)],2,sum)!=0), TRUE)]



