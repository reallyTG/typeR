library(roperators)


### Name: %+%
### Title: String operators
### Aliases: %+% %-% %s*% %s/%

### ** Examples

("ab" %+% "c") == "abc" # TRUE
("abc" %-% "b") == "ac" # TRUE
("ac" %s*% 2) == "acac" # TRUE
("acac" %s/% "c") == 2  # TRUE
# String division with a regular expression:
'an apple a day keeps the malignant spirit of Steve Jobs at bay' %s/% 'Steve Jobs|apple'




