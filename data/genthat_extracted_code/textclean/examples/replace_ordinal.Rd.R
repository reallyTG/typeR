library(textclean)


### Name: replace_ordinal
### Title: Replace Mixed Ordinal Numbers With Text Representation
### Aliases: replace_ordinal
### Keywords: ordinal-to-word

### ** Examples

x <- c(
    "I like the 1st one not the 22nd one.", 
    "For the 100th time stop!"
)
replace_ordinal(x)
replace_ordinal(x, TRUE)
replace_ordinal(x, remove = TRUE)
replace_number(replace_ordinal("I like the 1st 1 not the 22nd 1."))



