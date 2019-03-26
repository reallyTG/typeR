library(svMisc)


### Name: to_rjson
### Title: Convert R object to and from RJSON specification
### Aliases: to_rjson eval_rjson list_to_json toRjson evalRjson listToJson
### Keywords: utilities

### ** Examples

# A complex R object
obj <- structure(list(
  a = as.double(c(1:5, 6)),
  LETTERS,
  c = c(c1 = 4.5, c2 = 7.8, c3 = Inf, c4 = -Inf, NA, c6 = NaN),
  c(TRUE, FALSE, NA),
  e = factor(c("a", "b", "a")),
  f = 'this is a "string" with quote',
  g = matrix(rnorm(4), ncol = 2),
  `h&$@` = data.frame(x = 1:3, y = rnorm(3),
    fact = factor(c("b", "a", "b"))),
  i = Sys.Date(),
  j = list(1:5, y = "another item")),
  comment = "My comment",
  anAttrib = 1:10,
  anotherAttrib = list(TRUE, y = 1:4))

# Convert to simplest RJSON, without attributes
rjson1 <- to_rjson(obj)
rjson1
eval_rjson(rjson1)

# More complex RJSON, with attributes
rjson2 <- to_rjson(obj, TRUE)
rjson2
obj2 <- eval_rjson(rjson2)
obj2
# Numbers near equivalence comparison (note: identical(Robj, Robj2) is FALSE)
all.equal(obj, obj2)

rm(obj, obj2, rjson1, rjson2)



