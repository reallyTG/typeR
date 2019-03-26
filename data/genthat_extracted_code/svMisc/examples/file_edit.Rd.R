library(svMisc)


### Name: file_edit
### Title: Invoke an external text editor for a file
### Aliases: file_edit fileEdit
### Keywords: utilities

### ** Examples

## Not run: 
##D # Create a template file in the tempdir...
##D template <- tempfile("template", fileext = ".txt")
##D cat("Example template file to be used with file_edit()", file = template)
##D 
##D # ... and edit a new file, starting from that template:
##D new_file <- tempfile("test", fileext = ".txt")
##D file_edit(new_file, template = template, wait = TRUE)
##D 
##D message("Your file contains:")
##D readLines(new_file)
##D 
##D # Eliminate both the file and template
##D unlink(new_file)
##D unlink(template)
## End(Not run)



