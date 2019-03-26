library(sjmisc)


### Name: shorten_string
### Title: Shorten character strings
### Aliases: shorten_string

### ** Examples

s <- "This can be considered as very long string!"

# string is shorter than max.length, so returned as is
shorten_string(s, 60)

# string is shortened to as many words that result in
# a string of maximum 20 chars
shorten_string(s, 20)

# string including "considered" is exactly of length 22 chars
shorten_string(s, 22)




