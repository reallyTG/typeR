library(ijtiff)


### Name: linescan-conversion
### Title: Rejig linescan images.
### Aliases: linescan-conversion linescan_to_stack stack_to_linescan

### ** Examples

linescan <- ijtiff_img(array(rep(1:4, each = 4), dim = c(4, 4, 1, 1)))
print(linescan)
stack <- linescan_to_stack(linescan)
print(stack)
linescan <- stack_to_linescan(stack)
print(linescan)




