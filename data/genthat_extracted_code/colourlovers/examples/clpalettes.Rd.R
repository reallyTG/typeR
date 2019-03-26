library(colourlovers)


### Name: clpalettes
### Title: Retrieve color palette or palettes
### Aliases: clpalette clpalettes print.clpalette print.clpalettes

### ** Examples

e <- function(e) NULL # function for tryCatch to fail in examples

# get a random palette
tryCatch( clpalettes('random'), error = e)

# download top palettes
tryCatch( clpalettes('top', fmt='json'), error = e)

# plot at a single palette
pid <- '113451'
p <- tryCatch( clpalette(pid, fmt='json'), error = e)
if(!is.null(p)) plot(p)



