library(NNS)


### Name: NNS.term.matrix
### Title: NNS Term Matrix
### Aliases: NNS.term.matrix
### Keywords: document matrix term

### ** Examples

x <- data.frame(cbind(c("sunny", "rainy"), c(1, -1)))
NNS.term.matrix(x)

### Concatenate Text with space seperator, cbind with "DV"
x <- data.frame(cbind(c("sunny", "rainy"), c("windy", "cloudy"), c(1, -1)))
x <- data.frame(cbind(paste(x[ , 1], x[ , 2], sep = " "), as.numeric(as.character(x[ , 3]))))
NNS.term.matrix(x)


### NYT Example
## Not run: 
##D require(RTextTools)
##D data(NYTimes)
##D 
##D ### Concatenate Columns 3 and 4 containing text, with column 5 as DV
##D NYT=data.frame(cbind(paste(NYTimes[ , 3], NYTimes[ , 4], sep = " "),
##D                      as.numeric(as.character(NYTimes[ , 5]))))
##D NNS.term.matrix(NYT)
## End(Not run)



