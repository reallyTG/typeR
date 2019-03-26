library(biogram)


### Name: validate_encoding
### Title: Validate encoding
### Aliases: validate_encoding
### Keywords: manip

### ** Examples

enc1 = list(`1` = c("a", "t"), 
            `2` = c("g", "c"))
# see if enc1 is the correctly reduced nucleotide (DNA) alphabet
validate_encoding(enc1, c("a", "c", "g", "t"))

# enc1 is not the RNA alphabet, so the results is FALSE
validate_encoding(enc1, c("a", "c", "g", "u"))

# validate_encoding works also on other notations
enc2 = list(a = c(1, 4),
            b = c(2, 3))
validate_encoding(enc2, 1L:4)



