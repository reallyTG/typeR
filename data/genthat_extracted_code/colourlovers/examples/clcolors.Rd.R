library(colourlovers)


### Name: clcolors
### Title: Retrieve color or colors
### Aliases: clcolor clcolors print.clcolor print.clcolors

### ** Examples

e <- function(e) NULL # function for tryCatch to fail in examples

# get a random color
tryCatch( clcolors('random'), error = e)

# get a single color
tryCatch( clcolor('6B4106'), error = e)

# plot a single color clpng
co <- tryCatch( clcolor(rgb(0,0,1), fmt='json'), error = e)
if(!is.null(co)) plot(co)



