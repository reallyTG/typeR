library(expss)


### Name: info
### Title: Provides variables description for dataset
### Aliases: info

### ** Examples

data(mtcars)
var_lab(mtcars$am) = "Transmission"
val_lab(mtcars$am) = c("Automatic"=0, "Manual"=1)
info(mtcars, max_levels = 5)                             



