library(strex)


### Name: str_alphord_nums
### Title: Make string numbers comply with alphabetical order.
### Aliases: str_alphord_nums

### ** Examples

strings <- paste0("abc", 1:12)
strings
str_alphord_nums(strings)
str_alphord_nums(c("abc9def55", "abc10def7"))
str_alphord_nums(c("01abc9def55", "5abc10def777", "99abc4def4"))
str_alphord_nums(1:10)

## Not run: 
##D str_alphord_nums(c("abc9def55", "abc10xyz7"))
## End(Not run)



