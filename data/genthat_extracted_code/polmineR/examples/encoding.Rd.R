library(polmineR)


### Name: encoding
### Title: Get and set encoding.
### Aliases: encoding encoding<- encoding,textstat-method
###   encoding,bundle-method encoding,character-method

### ** Examples

# Get encoding of a corpus.
encoding("REUTERS")

# Get encoding of a partition.
r <- partition("REUTERS", places = "kuwait", regex = TRUE)
encoding(r)

# Get encoding of another class inheriting from textstat (count).
cnt <- count("REUTERS", p_attribute = "word")
encoding(cnt)

# Get encoding of objects in a bundle.
pb <- partition_bundle("REUTERS", s_attribute = "id")
encoding(pb)



