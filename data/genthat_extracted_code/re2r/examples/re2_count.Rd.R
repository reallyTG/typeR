library(re2r)


### Name: re2_count
### Title: Count the number of matches in a string.
### Aliases: re2_count

### ** Examples

re2_count("one", "(o.e)")
re2_count("123-234-2222", "\\d\\d\\d-\\d\\d\\d-\\d\\d\\d\\d")

words = c("sunny","beach","happy","really")
re2_count(words, "y")
re2_count(words, "^b")
re2_count(words, "[abc]")

# vectorize
re2_count("This", letters)



