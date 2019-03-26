library(forcats)


### Name: fct_count
### Title: Count entries in a factor
### Aliases: fct_count

### ** Examples

f <- factor(sample(letters)[rpois(1000, 10)])
table(f)
fct_count(f)
fct_count(f, sort = TRUE)



