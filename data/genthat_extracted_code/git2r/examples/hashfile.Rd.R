library(git2r)


### Name: hashfile
### Title: Determine the sha from a blob in a file
### Aliases: hashfile

### ** Examples

## Not run: 
##D ## Create a file. NOTE: The line endings from writeLines gives
##D ## LF (line feed) on Unix/Linux and CRLF (carriage return, line feed)
##D ## on Windows. The example use writeChar to have more control.
##D path <- tempfile()
##D f <- file(path, "wb")
##D writeChar("Hello, world!\n", f, eos = NULL)
##D close(f)
##D 
##D ## Generate hash
##D hashfile(path)
##D identical(hashfile(path), hash("Hello, world!\n"))
## End(Not run)



