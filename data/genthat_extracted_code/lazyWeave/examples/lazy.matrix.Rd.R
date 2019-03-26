library(lazyWeave)


### Name: lazy.matrix
### Title: Convert Matrix to LaTeX Table
### Aliases: lazy.matrix

### ** Examples

## Not run: 
##D lazy.write(
##D   lazy.file.start(),
##D   lazy.text("The mtcars dataset describes a number of vehicles.  
##D       Let's take a look at the data"),
##D   lazy.matrix(mtcars, rcol=(1:nrow(mtcars))[c(FALSE, TRUE)]),
##D   lazy.file.end(),
##D   OutFile="Example 1.tex")
##D 
##D unlink("Example 1.tex")
## End(Not run)




