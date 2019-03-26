library(rlang)


### Name: set_chr_encoding
### Title: Set encoding of a string or character vector
### Aliases: set_chr_encoding chr_encoding set_str_encoding str_encoding
### Keywords: internal

### ** Examples

# Encoding marks are always ignored on ASCII strings:
str_encoding(set_str_encoding("cafe", "UTF-8"))

# You can specify the encoding of strings containing non-ASCII
# characters:
cafe <- string(c(0x63, 0x61, 0x66, 0xC3, 0xE9))
str_encoding(cafe)
str_encoding(set_str_encoding(cafe, "UTF-8"))


# It is important to consistently mark the encoding of strings
# because R and other packages perform internal string conversions
# all the time. Here is an example with the names attribute:
latin1 <- string(c(0x63, 0x61, 0x66, 0xE9), "latin1")
latin1 <- set_names(latin1)

# The names attribute is encoded in latin1 as we would expect:
str_encoding(names(latin1))

# However the names are converted to UTF-8 by the c() function:
str_encoding(names(c(latin1)))
as_bytes(names(c(latin1)))

# Bad things happen when the encoding marker is lost and R performs
# a conversion. R will assume that the string is encoded according
# to the current locale:
## Not run: 
##D bad <- set_names(set_str_encoding(latin1, "unknown"))
##D mut_utf8_locale()
##D 
##D str_encoding(names(c(bad)))
##D as_bytes(names(c(bad)))
## End(Not run)



