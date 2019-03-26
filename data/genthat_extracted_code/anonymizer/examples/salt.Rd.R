library(anonymizer)


### Name: salt
### Title: Salt a vector.
### Aliases: salt

### ** Examples

# Use various number of characters
salt(letters, .n_chars = 0L)
salt(letters, .n_chars = 1L)
salt(letters, .n_chars = 5L)
salt(letters)

# Use other sets of characters to salt with
salt(letters, .chars = letters[1:2])



