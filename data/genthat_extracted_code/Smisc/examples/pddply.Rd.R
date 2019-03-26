library(Smisc)


### Name: pddply
### Title: Parallel wrapper for plyr::ddply
### Aliases: pddply

### ** Examples

data(baseball, package = "plyr")

## No test: 
# Summarize the number of entries for each year in the baseball dataset with 2 jobs
o1 <- pddply(baseball, ~ year, nrow, njobs = 2)
head(o1)

#  Verify it's the same as the non-parallel version of plyr::ddply()
o2 <- plyr::ddply(baseball, ~ year, nrow)
identical(o1, o2)


# Another possibility
o3 <- pddply(baseball, "lg", c("nrow", "ncol"), njobs = 2)
o3

o4 <- plyr::ddply(baseball, "lg", c("nrow", "ncol"))
identical(o3, o4)
## End(No test)

# A nonsense example where we need to pass objects and packages into the cluster
number1 <- 7

f <- function(x, number2 = 10) {
 paste(x$id[1], padZero(number1, num = 2), number2, sep = "-")
}

# In parallel
o5 <- pddply(baseball[1:100,], "year", f, number2 = 13, njobs = 2,
            .paropts = list(.packages = "Smisc", .export = "number1"))
o5

## No test: 
# Non parallel
o6 <- plyr::ddply(baseball[1:100,], "year", f, number2 = 13)
identical(o5, o6)
## End(No test)



