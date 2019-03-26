library(sjmisc)


### Name: row_count
### Title: Count row or column indices
### Aliases: row_count col_count

### ** Examples

dat <- data.frame(
  c1 = c(1, 2, 3, 1, 3, NA),
  c2 = c(3, 2, 1, 2, NA, 3),
  c3 = c(1, 1, 2, 1, 3, NA),
  c4 = c(1, 1, 3, 2, 1, 2)
)

row_count(dat, count = 1, append = FALSE)
row_count(dat, count = NA, append = FALSE)
row_count(dat, c1:c3, count = 2, append = TRUE)

col_count(dat, count = 1, append = FALSE)
col_count(dat, count = NA, append = FALSE)
col_count(dat, c1:c3, count = 2, append = TRUE)




