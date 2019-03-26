library(DescTools)


### Name: AscToChar
### Title: Convert ASCII Codes to Characters and Vice Versa
### Aliases: AscToChar CharToAsc
### Keywords: manip

### ** Examples

(x <- CharToAsc("Silvia"))

# will be pasted together
AscToChar(x)

# use strsplit if the single characters are needed
strsplit(AscToChar(x), split=NULL)

# this would be an alternative, but the latter would be of class raw
DecToHex(CharToAsc("Silvia"))
charToRaw("Silvia")



