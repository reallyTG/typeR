library(pracma)


### Name: fprintf
### Title: Formatted Printing (Matlab style)
### Aliases: fprintf
### Keywords: utilities

### ** Examples

##  Examples:
nbytes <- fprintf("Results are:\n", file = "")
for (i in 1:10) {
    fprintf("%4d  %15.7f\n", i, exp(i), file = "")
}



