library(fuzzyjoin)


### Name: interval_join
### Title: Join two tables based on overlapping (low, high) intervals
### Aliases: interval_join interval_inner_join interval_left_join
###   interval_right_join interval_full_join interval_semi_join
###   interval_anti_join

### ** Examples


if (requireNamespace("IRanges", quietly = TRUE)) {
  x1 <- data.frame(id1 = 1:3, start = c(1, 5, 10), end = c(3, 7, 15))
  x2 <- data.frame(id2 = 1:3, start = c(2, 4, 16), end = c(4, 8, 20))

  interval_inner_join(x1, x2)

  # Allow them to be separated by a gap with a maximum:
  interval_inner_join(x1, x2, maxgap = 1)   # let 1 join with 2
  interval_inner_join(x1, x2, maxgap = 20)  # everything joins each other

  # Require that they overlap by more than a particular amount
  interval_inner_join(x1, x2, minoverlap = 3)

  # other types of joins:
  interval_full_join(x1, x2)
  interval_left_join(x1, x2)
  interval_right_join(x1, x2)
  interval_semi_join(x1, x2)
  interval_anti_join(x1, x2)
}




