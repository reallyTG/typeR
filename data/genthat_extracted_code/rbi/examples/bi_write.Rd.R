library(rbi)


### Name: bi_write
### Title: Create (e.g., init or observation) files for LibBi
### Aliases: bi_write

### ** Examples

filename <- tempfile(pattern="dummy", fileext=".nc")
a <- 3
b <- data.frame(dim_a = rep(1:3, time = 2), dim_b = rep(1:2, each = 3), value = 1:6)
variables <- list(a=a, b=b)
bi_write(filename, variables)
bi_file_summary(filename)



