library(textshape)


### Name: split_run
### Title: Split Runs
### Aliases: split_run split_run.default split_run.data.frame

### ** Examples

x1 <- c(
     "122333444455555666666",
     NA,
     "abbcccddddeeeeeffffff",
     "sddfg",
     "11112222333"
)

x <- c(rep(x1, 2), ">>???,,,,....::::;[[")

split_run(x)


DATA[["run.col"]] <- x
split_run(DATA, "run.col")



