library(BBmisc)


### Name: coalesce
### Title: Returns first non-missing, non-null argument.
### Aliases: coalesce

### ** Examples

f = function(x,y) {
  print(coalesce(NULL, x, y))
}
f(y = 3)



