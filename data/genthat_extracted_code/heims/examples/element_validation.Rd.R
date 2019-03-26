library(heims)


### Name: element_validation
### Title: Validate HEIMS elements
### Aliases: element_validation validate_elements prop_elements_valid
###   count_elements_invalid

### ** Examples

X <- data.frame(E306 = c(0, 1011, 999, 9998))
validate_elements(X)  # FALSE
prop_elements_valid(X)
X <- data.frame(E306 = as.integer(c(0, 1011, 999, 9998)))
validate_elements(X)  # TRUE




