library(EngrExpt)


### Name: whitearea
### Title: Comparison of mixing processes
### Aliases: whitearea
### Keywords: datasets

### ** Examples

str(whitearea)
qqmath(~ whitearea, whitearea, groups = process, aspect = 1,
       auto.key = list(space = "right", title = "Process"),
       xlab = "Standard normal quantiles",
       ylab = "White area")
t.test(whitearea ~ process, whitearea)



