library(R.rsp)


### Name: rfile
### Title: Evaluates and postprocesses an RSP document and outputs the
###   final RSP document file
### Aliases: rfile.default rfile rfile.RspString rfile.RspDocument
###   rfile.RspRSourceCode rfile.function rfile.expression
### Keywords: file IO

### ** Examples

path <- system.file("exData", package="R.rsp")
pathname <- rfile("random.txt.rsp", path=path)
print(pathname)

lines <- readLines(pathname, warn=FALSE)
cat(lines, collapse="\n")


# Passing arguments
path <- system.file("exData", package="R.rsp")
pathname <- rfile("random-args.txt.rsp", path=path, args=list(K=50))
print(pathname)

lines <- readLines(pathname, warn=FALSE)
cat(lines, collapse="\n")


## Not run: 
##D # Compile and display the main vignette (requires LaTeX)
##D if (isCapableOf(R.rsp, "latex")) {
##D   path <- system.file("doc", package="R.rsp")
##D   pdf <- rfile("Dynamic_document_creation_using_RSP.tex.rsp", path=path)
##D   cat("Created document: ", pdf, "\n", sep="")
##D   if (interactive()) browseURL(pdf)
##D }
## End(Not run)



