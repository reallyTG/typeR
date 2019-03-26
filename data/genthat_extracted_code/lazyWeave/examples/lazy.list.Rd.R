library(lazyWeave)


### Name: lazy.list
### Title: Lists in LaTeX and HTML
### Aliases: lazy.list

### ** Examples

## Not run: 
##D lazy.write(
##D   lazy.file.start(),
##D   lazy.text("A vector can be presented as a list as follows"),
##D   lazy.list(c("First item", "Second item", "Third item", 
##D               "Fourth item", "Fifth item"), style="Alph"),
##D   lazy.file.end(),
##D   OutFile="Example 1.tex")
##D 
##D unlink("Example 1.tex")
## End(Not run)




