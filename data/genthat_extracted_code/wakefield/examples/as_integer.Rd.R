library(wakefield)


### Name: as_integer
### Title: Convert a Factor Data Frame to Integer
### Aliases: as_integer
### Keywords: integer numeric

### ** Examples

as_integer(r_series(likert_7, 5, 10))
as_integer(r_series(likert_7, 5, 10), cols = c(2, 4))

library(dplyr)
r_data_frame(n=100,
    age,
    political,
    sex,
    grade
) %>%
    as_integer(2:3)



