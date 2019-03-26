library(corrr)


### Name: stretch
### Title: Stretch correlation data frame into long format.
### Aliases: stretch

### ** Examples

x <- correlate(mtcars)
stretch(x)  # Convert all to long format
stretch(x, na.rm = FALSE)  # omit NAs (diagonal in this case)

x <- shave(x)  # use shave to set upper triangle to NA and then...
stretch(x, na.rm = FALSE)  # omit all NAs, therefore keeping each
                             # correlation only once.



