library(nlme)


### Name: isBalanced
### Title: Check a Design for Balance
### Aliases: isBalanced isBalanced.groupedData
### Keywords: data

### ** Examples

isBalanced(Orthodont)                    # should return TRUE
isBalanced(Orthodont, countOnly = TRUE)  # should return TRUE
isBalanced(Pixel)                        # should return FALSE
isBalanced(Pixel, level = 1)             # should return FALSE



