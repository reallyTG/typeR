library(labelled)


### Name: recode.labelled
### Title: Recode values
### Aliases: recode.labelled

### ** Examples

x <- labelled(1:3, c(yes = 1, no = 2))
x
dplyr::recode(x, `3` = 2L)



