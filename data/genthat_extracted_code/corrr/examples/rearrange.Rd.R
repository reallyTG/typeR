library(corrr)


### Name: rearrange
### Title: Re-arrange a correlation data frame
### Aliases: rearrange

### ** Examples

x <- correlate(mtcars)

rearrange(x) # Default settings
rearrange(x, method = "HC")  # Different seriation method
rearrange(x, absolute = FALSE)  # Not using absolute values for arranging



