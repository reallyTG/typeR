library(R.utils)


### Name: countLines
### Title: Counts the number of lines in a text file
### Aliases: countLines.default countLines
### Keywords: programming

### ** Examples

pathname <- system.file("NEWS", package="R.utils");
n <- countLines(pathname);
n2 <- length(readLines(pathname));
stopifnot(n == n2);



