library(DescTools)


### Name: Vigenere
### Title: Vigenere Cypher
### Aliases: Vigenere
### Keywords: math

### ** Examples

key <- "My FavoriteKey452"
(xenc <- Vigenere("Beware the Jabberwock, my son! The jaws that bite, the claws that catch!", key))

Vigenere(xenc, key, decrypt = TRUE)
# note that everything besides the characters in the list will be discarded



