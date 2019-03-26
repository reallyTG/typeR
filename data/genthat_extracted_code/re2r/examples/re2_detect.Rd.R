library(re2r)


### Name: re2_detect
### Title: Test a pattern in strings, and return boolean.
### Aliases: re2_detect

### ** Examples

re2_detect("one", "(o.e)")
re2_detect("123-234-2222", "\\d\\d\\d-\\d\\d\\d-\\d\\d\\d\\d")

words = c("sunny","beach","happy","really")
re2_detect(words, "y")
re2_detect(words, "^b")
re2_detect(words, "[abc]")

# vectorize
(res = re2_detect("This", letters))
letters[res]

letters[re2_detect("This", letters, case_sensitive = FALSE)]

letters[re2_detect("This", re2(letters, case_sensitive = FALSE))]

# In stringi, "" empty search patterns return NA.
# In re2r, empty search patterns will match
# empty string.

re2_detect("abc", "")
stringi::stri_detect("abc", regex = "")




