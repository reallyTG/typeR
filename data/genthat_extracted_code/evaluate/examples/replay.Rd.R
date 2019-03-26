library(evaluate)


### Name: replay
### Title: Replay a list of evaluated results.
### Aliases: replay

### ** Examples

samples <- system.file("tests", "testthat", package = "evaluate")
if (file_test("-d", samples)) {
    replay(evaluate(file(file.path(samples, "order.r"))))
    replay(evaluate(file(file.path(samples, "plot.r"))))
    replay(evaluate(file(file.path(samples, "data.r"))))
}



