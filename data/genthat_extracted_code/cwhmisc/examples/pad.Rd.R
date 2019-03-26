library(cwhmisc)


### Name: padding
### Title: Padding a string with justification, insertion
### Aliases: pad justify insstr
### Keywords: character

### ** Examples

pad("My string",25,"c","XoX")
 # [1] "XoXXoXXoMy stringXXoXXoXX"
pad("My string",25) # left aligned
(str <- paste00(LETTERS)) # "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
pad(str, 37, "right", " $ ")
insstr(str," $ ",7) # "ABCDEF $ GHIJKLMNOPQRSTUVWXYZ"



