library(checkr)


### Name: check_data
### Title: Check Data
### Aliases: check_data

### ** Examples

z <- data.frame(
 Count = c(0L, 3L, 3L, 0L, NA), 
  Longitude = c(0, 0, 90, 90, 180), 
  Latitude = c(0, 90, 90.2, 100, -180),
  Type = factor(c("Good", "Bad", "Bad", "Bad", "Bad"), levels = c("Good", "Bad")),
  Extra = TRUE,
  Comments = c("In Greenwich", "Somewhere else", "I'm lost", 
    "I didn't see any", "Help"), 
  stringsAsFactors = FALSE)

check_data(z, values = list(
  Count = 1,
  Extra = NA,
  Latitude = c(45, 90)
  ), exclusive = TRUE, order = TRUE, nrow = 10L, key = "Longitude", error = FALSE)



