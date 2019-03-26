library(frequencies)


### Name: freq_vect
### Title: freq_vect
### Aliases: freq_vect

### ** Examples

# Sample vector and data frame to demo the freq_vect function.
numbers <- sample(1:10, 200, replace = TRUE)
tbl     <- data.frame(numbers = sample(1:10, 200, replace = TRUE),
  letters = sample(letters, 200, replace = TRUE),
  dates = sample(seq(as.Date('1999/10/01'), as.Date('2000/01/01'), by="day"),
                 200, replace = TRUE),
  logicals = sample(c(TRUE, FALSE), 200, replace = TRUE),
  stringsAsFactors = FALSE)

freq_vect(numbers)
freq_vect(tbl$numbers)
freq_vect(tbl$letters, sort_by_count = TRUE, total_row = FALSE)
freq_vect(mtcars$cyl)



