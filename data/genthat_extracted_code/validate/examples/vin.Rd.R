library(validate)


### Name: %vin%
### Title: A consistent set membership operator
### Aliases: %vin%

### ** Examples

# we cannot be sure about the first element:
c(NA, "a") %vin% c("a","b")

# we cannot be sure about the 2nd and 3rd element (but note that they
# cannot both be TRUE):
c("a","b","c") %vin% c("a",NA)

# we can be sure about all elements:
c("a","b") %in% character(0)




