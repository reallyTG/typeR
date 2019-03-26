library(lazyWeave)


### Name: lazy.text
### Title: Paragraphs in LaTeX
### Aliases: lazy.text

### ** Examples

## Not run: 
##D lazy.write(
##D   lazy.file.start(),
##D   lazy.text("Typically we want our paragraphs to be left 
##D     justified.  This is often what we expect to see when reading."),
##D   lazy.text("However, we may also have occasions where we would 
##D     like to center our text.  It's one of many ways we can make the 
##D     words stand out on the page", align="center"),
##D   lazy.text("A more traditional way to make the text stand out might be
##D     to use bold text or italics, such as these", bold=TRUE, italic=TRUE),
##D   lazy.file.end(),
##D   OutFile="Example 1.tex")
##D   
##D unlink("Example 1.tex")
## End(Not run)




