library(Unicode)


### Name: u_char_names
### Title: Unicode Character Names
### Aliases: u_char_name u_char_from_name u_char_label

### ** Examples

x <- as.u_char(utf8ToInt("Austria"))
u_char_name(x)

## Derived Hangul syllable character names are also supported for
## finding characters by exact matching:
x <- u_char_name("0xAC00")
x
u_char_from_name(x)

## Find all Unicode characters with name matching 'DIGIT ONE'.
x <- u_char_from_name("\\bDIGIT ONE\\b", "g")
## And show their names.
u_char_name(x)



