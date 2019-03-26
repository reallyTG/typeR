library(lazyWeave)


### Name: lazy.page.break
### Title: Start New Page in LaTeX
### Aliases: lazy.page.break

### ** Examples

## Not run: 
##D lazy.write(
##D lazy.file.start(),
##D lazy.text("First we type something on the first page"),
##D lazy.page.break(),
##D lazy.text("Then we type something on the second page"),
##D lazy.file.end(),
##D OutFile="Example 1.tex")
##D 
##D unlink("Example 1.tex")
## End(Not run)



