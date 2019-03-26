library(sjlabelled)


### Name: tidy_labels
### Title: Repair value labels
### Aliases: tidy_labels

### ** Examples

library(sjmisc)
x <- set_labels(
  sample(1:5, size = 20, replace = TRUE),
  labels = c("low" = 1, ".." = 2, ".." = 3, ".." = 4, "high" = 5)
)
frq(x)

z <- tidy_labels(x)
frq(z)

z <- tidy_labels(x, sep = ".")
frq(z)

z <- tidy_labels(x, remove = TRUE)
frq(z)




