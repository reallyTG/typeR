library(bpa)


### Name: match_pattern
### Title: Pattern Matching
### Aliases: match_pattern

### ** Examples

phone <- c("123-456-7890", "456-7890", "123-4567", "456-7890")
match_pattern(phone, pattern = "999-9999")
match_pattern(phone, pattern = "999-9999", unique_only = TRUE)



