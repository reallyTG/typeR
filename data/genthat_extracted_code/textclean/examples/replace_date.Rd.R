library(textclean)


### Name: replace_date
### Title: Replace Dates With Words
### Aliases: replace_date

### ** Examples

x <- c(
    NA, '11-16-1980 and 11/16/1980', 
    "and 2017-02-08 but then there's 2/8/2017 too"
)

replace_date(x)
replace_date(x, replacement = '<<DATE>>')



