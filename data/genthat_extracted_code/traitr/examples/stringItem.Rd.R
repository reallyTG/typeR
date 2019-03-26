library(traitr)


### Name: stringItem
### Title: A string item
### Aliases: stringItem

### ** Examples

## basic usage
a <- stringItem("ac", name="x")
a$get_x()
a$set_x("abc213")
a$get_x()
## eval first
a <- stringItem("ac", name="x", eval_first=TRUE)
a$set_x("2 + 2")
a$get_x()
a$to_R()



