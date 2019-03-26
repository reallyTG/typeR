library(rebus.base)


### Name: CharacterClasses
### Title: Class Constants
### Aliases: CharacterClasses ALPHA ALNUM BLANK CNTRL DIGIT GRAPH LOWER
###   PRINT PUNCT SPACE UPPER HEX_DIGIT ANY_CHAR GRAPHEME NEWLINE DGT WRD
###   SPC NOT_DGT NOT_WRD NOT_SPC ASCII_DIGIT ASCII_LOWER ASCII_UPPER
###   ASCII_ALPHA ASCII_ALNUM UNMATCHABLE
### Keywords: datasets

### ** Examples

# R character classes
ALNUM
ALPHA
BLANK
CNTRL
DIGIT
GRAPH
LOWER
PRINT
PUNCT
SPACE
UPPER
HEX_DIGIT

# Special chars
ANY_CHAR
GRAPHEME
NEWLINE

# Generic classes
DGT
WRD
SPC

# Generic negated classes
NOT_DGT
NOT_WRD
NOT_SPC

# Non-locale-specific classes
ASCII_DIGIT
ASCII_LOWER
ASCII_UPPER
ASCII_ALPHA
ASCII_ALNUM

# An oxymoron
UNMATCHABLE

# Usage
x <- c("a1 A", "a1 a")
rx <- LOWER %R% DIGIT %R% SPACE %R% UPPER
stringi::stri_detect_regex(x, rx)



