library(rlang)


### Name: string
### Title: Create a string
### Aliases: string

### ** Examples

# As everywhere in R, you can specify a string with Unicode
# escapes. The characters corresponding to Unicode codepoints will
# be encoded in UTF-8, and the string will be marked as UTF-8
# automatically:
cafe <- string("caf\uE9")
str_encoding(cafe)
as_bytes(cafe)

# In addition, string() provides useful conversions to let
# programmers control how the string is represented in memory. For
# encodings other than UTF-8, you'll need to supply the bytes in
# hexadecimal form. If it is a latin1 encoding, you can mark the
# string explicitly:
cafe_latin1 <- string(c(0x63, 0x61, 0x66, 0xE9), "latin1")
str_encoding(cafe_latin1)
as_bytes(cafe_latin1)



