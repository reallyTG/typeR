library(kutils)


### Name: checkCoercion
### Title: Check if values can be safely coerced without introduction of
###   missing values
### Aliases: checkCoercion

### ** Examples

x1 <- c("TRUE", "FALSE", FALSE, TRUE, NA, ".", "N/A", " ", "")
checkCoercion(x1, "logical")
x1 <- c(x1, "TRUE.FALSE", "Has a space")
## Should fail:
checkCoercion(x1, "logical")
x2 <- c(4, 5, 6, 9.2, ".", " ")
## Should fail
checkCoercion(x2, "logical")
x3 <- factor(c("bob", "emily", "bob", "jane", "N/A", " ", NA, "NA"))
checkCoercion(x3, "ordered")
checkCoercion(x3, "integer")
## Should fail:
checkCoercion(x3, "logical")




