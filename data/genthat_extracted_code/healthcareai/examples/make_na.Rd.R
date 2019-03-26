library(healthcareai)


### Name: make_na
### Title: Replace missingness values with NA and correct columns types
### Aliases: make_na

### ** Examples

dat <- data.frame(gender = c("male", "male", "female", "male", "missing"),
              name = c("Paul", "Jim", "Sarah", "missing", "Alex"),
              weight = c(139, 0, 193, 158, 273))

# Replace "missing" in `dat`
make_na(dat, "missing")

# If there are multiple missing values, pass them through a vector.
dat <- data.frame(gender = c("male", "??", "female", "male", "NULL"),
              age = c(64, 52, 75, "NULL", 70),
              weight = c(139, 0, 193, "??", 273),
              stringsAsFactors = FALSE)

make_na(dat, c("??", "NULL"))

# Run `missingness()` to find possible missingness values in `dat`. It will
# suggest the default implementation of `make_na` to replace all found
# missingness values (the suggested default implementation for this example
# is `make_na(dat, c("??", "NULL"))`).
missingness(dat)
make_na(dat, c("??", "NULL"))

# Note: In this last example, `age` should be loaded as a numeric vector, but
# since "NULL" is present, it is stored as a character vector. When "NULL" is
# replaced, `age` will be converted to a numeric vector.




