library(textclean)


### Name: replace_money
### Title: Replace Money With Words
### Aliases: replace_money

### ** Examples

x <- c(
    NA, 
    '$3.16 into "three dollars, sixteen cents"', 
    "-$20,333.18 too", 'fff'
)

replace_money(x)
replace_money(x, replacement = '<<MONEY>>')



