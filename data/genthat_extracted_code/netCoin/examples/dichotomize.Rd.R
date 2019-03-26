library(netCoin)


### Name: dichotomize
### Title: Dichotomize.
### Aliases: dichotomize

### ** Examples

# A character column
frame1 <- data.frame(A = c("Man", "Women", "Man", "Undet."))
dichotomize(frame1, "A", sep = "; ")

# A character column (with separator)
frame2 <- data.frame(A = c("Man; Women", "Women; Women",
                         "Man; Man", "Undet.; Women; Man"))
dichotomize(frame2, "A", sep = "; ")

# A character column and another factor column (same sepatator)
frame3 <- data.frame(A = c("Man; Women", "Women; Women",
                         "Man; Man", "Undet.; Women; Man"),
                     C = factor(c(1:4), labels = c("Paris", "New York",
                         "London; New York", "<NA>")))
dichotomize(frame3, c("A", "C"), sep = "; ")



