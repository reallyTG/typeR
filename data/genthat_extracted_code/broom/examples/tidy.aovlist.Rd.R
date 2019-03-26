library(broom)


### Name: tidy.aovlist
### Title: Tidy a(n) aovlist object
### Aliases: tidy.aovlist

### ** Examples


a <- aov(mpg ~ wt + qsec + Error(disp / am), mtcars)
tidy(a)




