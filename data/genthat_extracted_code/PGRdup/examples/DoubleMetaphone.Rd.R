library(PGRdup)


### Name: DoubleMetaphone
### Title: Double Metaphone Phonetic Algorithm
### Aliases: DoubleMetaphone

### ** Examples

# Return the primary and secondary Double Metaphone encodings for a character vector.
str1 <- c("Jyothi", "Jyoti")
str2 <- c("POLLACHI", "BOLLACHI")
DoubleMetaphone(str1)
DoubleMetaphone(str2)
## Not run: 
##D # Issue a warning in case of non-ASCII characters.
##D str3 <- c("J\xf5geva", "Jogeva")
##D DoubleMetaphone(str3) 
## End(Not run)



