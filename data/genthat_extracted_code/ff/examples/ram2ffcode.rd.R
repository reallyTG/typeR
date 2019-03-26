library(ff)


### Name: ram2ffcode
### Title: Factor codings
### Aliases: ram2ffcode ram2ramcode
### Keywords: IO data

### ** Examples

 ram2ffcode(letters, letters, vmode="byte")
 ram2ffcode(letters, letters, vmode="ubyte")
 ram2ffcode(letters, letters, vmode="nibble")
 message('note that ram2ffcode() does NOT warn that vmode="nibble" cannot store 26 levels')



