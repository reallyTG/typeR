library(diffdf)


### Name: diffdf_has_issues
### Title: diffdf_has_issues
### Aliases: diffdf_has_issues

### ** Examples


# Example with no issues
x <- diffdf( iris, iris )
diffdf_has_issues(x)

# Example with issues
iris2 <- iris
iris2[2,2] <- NA
x <- diffdf( iris , iris2 , suppress_warnings = TRUE)
diffdf_has_issues(x)



