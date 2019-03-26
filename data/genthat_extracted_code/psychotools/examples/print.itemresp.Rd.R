library(psychotools)


### Name: print.itemresp
### Title: Formatting Item Response Data
### Aliases: print.itemresp format.itemresp
### Keywords: classes

### ** Examples

## item responses from binary matrix
x <- cbind(c(1, 0, 1, 0), c(1, 0, 0, 0), c(0, 1, 1, 1))
xi <- itemresp(x)
## change mscale
mscale(xi) <- c("-", "+")
xi

## flexible formatting
## no/other brackets
print(xi, brackets = FALSE)
print(xi, brackets = c(">>", "<<"))

## include item labels (with different separators)
print(xi, labels = TRUE)
print(xi, labels = TRUE, sep = c(" | ", ": "))

## handling longer mscale categories
mscale(xi) <- c("disagree", "agree")
print(xi)
print(xi, mscale = FALSE)
print(xi, abbreviate = FALSE)
print(xi, abbreviate = FALSE, width = 23)
print(xi, abbreviate = 2)



