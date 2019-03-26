library(detector)


### Name: has_national_identification_numbers
### Title: Test if a character vector has any national identification
###   numbers.
### Aliases: has_national_identification_numbers

### ** Examples

# Examples
# Examples
has_national_identification_numbers("hello") # FALSE
has_national_identification_numbers(65884) # FALSE
has_national_identification_numbers("111-33-5555") # TRUE
has_national_identification_numbers(1113335555) # FALSE



