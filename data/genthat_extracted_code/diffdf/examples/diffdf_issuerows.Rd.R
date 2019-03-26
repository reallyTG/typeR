library(diffdf)


### Name: diffdf_issuerows
### Title: diffdf_issuerows
### Aliases: diffdf_issuerows

### ** Examples

iris2 <- iris
for ( i in 1:3) iris2[i,i] <- 99
x <- diffdf( iris , iris2, suppress_warnings = TRUE)
diffdf_issuerows( iris , x)
diffdf_issuerows( iris2 , x)
diffdf_issuerows( iris2 , x , vars = "Sepal.Length")
diffdf_issuerows( iris2 , x , vars = c("Sepal.Length" , "Sepal.Width"))



