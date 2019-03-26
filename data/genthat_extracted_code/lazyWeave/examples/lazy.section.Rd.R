library(lazyWeave)


### Name: lazy.section
### Title: Open Sections in LaTeX Documents
### Aliases: lazy.section

### ** Examples

## Not run: 
##D   lazy.write(
##D   lazy.file.start(),
##D   lazy.section("Section A", ordered=TRUE),
##D   lazy.text("Notice that Section A is numbered"),
##D   lazy.section("Subsection", type="sub", ordered=FALSE),
##D   lazy.text("But the subsection is not numbered"),
##D   lazy.file.end(),
##D   OutFile="Example-1.tex")
##D   
##D   unlink("Example-1.tex")
##D  
## End(Not run)
 



