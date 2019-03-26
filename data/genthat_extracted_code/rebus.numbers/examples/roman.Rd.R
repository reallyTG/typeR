library(rebus.numbers)


### Name: roman
### Title: Roman numerals
### Aliases: ROMAN roman
### Keywords: datasets

### ** Examples

# Constant form and character class
ROMAN
roman()

x <- c("MMMDCCCXLVIII", "MMMCMDCCCXLVIIV")
rx <- rebus.base::exactly(roman())
grepl(rx, x)



