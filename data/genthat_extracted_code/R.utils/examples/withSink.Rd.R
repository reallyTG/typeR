library(R.utils)


### Name: withSink
### Title: Evaluate an R expression while temporarily diverting output
### Aliases: withSink
### Keywords: IO programming

### ** Examples

# Divert standard output
pathname <- tempfile(fileext=".output.txt")
res <- withSink(file=pathname, {
  print(letters)
})
mcat(readLines(pathname), sep="\n")


# Divert standard error/messages
pathname <- tempfile(fileext=".message.txt")
res <- withSink(file=pathname, type="message", {
  mprint(LETTERS)
})
mcat(readLines(pathname), sep="\n")



