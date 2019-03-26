library(traitr)


### Name: numericItem
### Title: Item for numbers
### Aliases: numericItem

### ** Examples

## basic use
a <- numericItem(0, name="x")
a$set_x(10)
a$get_x()
## eval can be instructed
a <- numericItem(0, name="x", eval_first=TRUE)
a$set_x("1:5")
a$get_x()
a$to_R()



