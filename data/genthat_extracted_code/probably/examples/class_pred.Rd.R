library(probably)


### Name: class_pred
### Title: Create a class prediction object
### Aliases: class_pred

### ** Examples


x <- factor(c("Yes", "No", "Yes", "Yes"))

# Create a class_pred object from a factor
class_pred(x)

# Say you aren't sure about that 2nd "Yes" value. You could mark it as
# equivocal.
class_pred(x, which = 3)

# Maybe you want a different equivocal label
class_pred(x, which = 3, equivocal = "eq_value")




