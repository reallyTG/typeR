library(bsts)


### Name: shorten
### Title: Shorten long names
### Aliases: Shorten
### Keywords: character

### ** Examples

  Shorten(c("/usr/common/foo.tex", "/usr/common/barbarian.tex"))
  # returns c("foo", "barbarian")

  Shorten(c("hello", "hellobye"))
  # returns c("", "bye")

  Shorten(c("hello", "hello"))
  # returns c("hello", "hello")

  Shorten(c("", "x", "xx"))
  # returns c("", "x", "xx")

  Shorten("abcde")
  # returns "abcde"



