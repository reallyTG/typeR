library(RCurl)


### Name: curlEscape
### Title: Handle characters in URL that need to be escaped
### Aliases: curlEscape curlUnescape curlPercentEncode
### Keywords: IO

### ** Examples

  curlEscape("http://www.abc.com?x=a is a sentence&a b=and another")

  # Reverse it should get back original
  curlUnescape(curlEscape("http://www.abc.com?x=a is a sentence&a b=and another"))



