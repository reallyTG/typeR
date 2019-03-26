library(umx)


### Name: umx_trim
### Title: Trim whitespace surrounding a string.
### Aliases: umx_trim

### ** Examples

umx_trim(" dog") # "dog"
umx_trim("dog ") # "dog"
umx_trim("\t dog \n") # "dog"
umx_trim("xlsx dog.xlsx", "\\.xlsx$") # "dog"



