library(stringi)


### Name: stri_trim_both
### Title: Trim Characters from the Left and/or Right Side of a String
### Aliases: stri_trim_both stri_trim stri_trim_left stri_trim_right

### ** Examples

stri_trim_left("               aaa")
stri_trim_right("rexamine.com/", "\\p{P}")
stri_trim_both(" Total of 23.5 bitcoins. ", "\\p{N}")
stri_trim_both(" Total of 23.5 bitcoins. ", "\\p{L}")




