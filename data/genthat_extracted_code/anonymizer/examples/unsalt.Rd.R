library(anonymizer)


### Name: unsalt
### Title: Unsalt a vector.
### Aliases: unsalt

### ** Examples

# Use various number of characters
unsalt(salt(letters, .n_chars = 0L))
unsalt(salt(letters, .n_chars = 1L))
unsalt(salt(letters, .n_chars = 5L))
unsalt(salt(letters))

# Use other sets of characters to salt with
unsalt(salt(letters, .chars = letters[1:2]), .chars = letters[1:2])



