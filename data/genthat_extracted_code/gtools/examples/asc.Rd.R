library(gtools)


### Name: asc
### Title: Convert between characters and ASCII codes
### Aliases: asc chr
### Keywords: character programming

### ** Examples

  ## ascii codes for lowercase letters
  asc(letters)

  ## uppercase letters from ascii codes
  chr(65:90)

  ## works on muti-character strings
  ( tmp <- asc('hello!') )
  chr(tmp)

  ## Use 'simplify=FALSE' to return the result as a list
  ( tmp <- asc('hello!', simplify=FALSE) )
  chr(tmp)

  ## When simplify=FALSE the results can be...
  asc( c('a', 'e', 'i', 'o', 'u', 'y' ) ) # a vector
  asc( c('ae', 'io', 'uy' ) )             # or a matrix

  ## When simplify=TRUE the results are always a list...
  asc( c('a', 'e', 'i', 'o', 'u', 'y' ), simplify=FALSE )
  asc( c('ae', 'io', 'uy' ), simplify=FALSE)



