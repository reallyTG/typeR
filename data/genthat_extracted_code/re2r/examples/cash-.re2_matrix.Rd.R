library(re2r)


### Name: $.re2_matrix
### Title: Get a match group
### Aliases: $.re2_matrix

### ** Examples

text = c("this is test",
    "this is test, and this is not test",
    "they are tests")
res = re2_match(
    string = text,
    pattern = "(?P<testname>this)( is)"
)
class(res)
is.matrix(res)
is.character(res)
print(res)
res$testname
res$.match
res$`.2`
res[, ".2"]
res[, ".match"]
res[, "testname"]



