library(R.oo)


### Name: intToChar
### Title: Converts a vector of integers into a vector of ASCII characters
### Aliases: intToChar.default intToChar
### Keywords: character internal

### ** Examples

  i <- charToInt(unlist(strsplit("Hello world!", split=NULL)))
  # Gives: 72 101 108 108 111  32 119 111 114 108 100  33
  ch <- intToChar(c(72,101,108,108,111,32,119,111,114,108,100,33))
  # Gives: "H" "e" "l" "l" "o" " " "w" "o" "r" "l" "d" "!"



