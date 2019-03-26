library(miscset)


### Name: strextr
### Title: Extract a Substring
### Aliases: strextr
### Keywords: extract string

### ** Examples

#

library(stringr)

s <- c("A1 B1 C1","A2 B2", "AA A1", "AA", "B1 A1", "BB AB A1")

strextr(s, "^[AB][[:digit:]]$") # deprecated
str_extract(s, "[AB][:digit:]")

strextr(s, "^[AB][[:digit:]]$", mult = TRUE) # deprecated
str_extract_all(s, "[AB][:digit:]")

strextr(s, "^[AB][[:digit:]]$", mult = TRUE, unlist = TRUE) # deprecated
unlist(str_extract_all(s, "[AB][:digit:]")) # has no <NA> values

strextr(s, "^[C][[:digit:]]$") # deprecated
str_extract(s, "[C][:digit:]")

#



