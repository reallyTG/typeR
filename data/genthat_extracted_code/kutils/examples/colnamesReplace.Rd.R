library(kutils)


### Name: colnamesReplace
### Title: Replace column names with new names from a named vector
### Aliases: colnamesReplace

### ** Examples

set.seed(234234)
N <- 200
mydf <- data.frame(x5 = rnorm(N), x4 = rnorm(N), x3 = rnorm(N),
                   x2 = letters[sample(1:24, 200, replace = TRUE)],
                   x1 = factor(sample(c("cindy", "bobby", "marsha",
                                        "greg", "chris"), 200, replace = TRUE)),
                   stringsAsFactors = FALSE)
mydf2 <- colnamesReplace(mydf, newnames = c("x4" = "GLOPPY"))
mydf2 <- colnamesReplace(mydf, newnames = c("x4" = "GLOPPY", "USA" = "Interesting"), verbose = TRUE)
colnames(mydf)



