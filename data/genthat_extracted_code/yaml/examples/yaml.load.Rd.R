library(yaml)


### Name: yaml.load
### Title: Convert a YAML string into R objects
### Aliases: yaml.load yaml.load_file
### Keywords: programming data manip

### ** Examples

  yaml.load("- hey\n- hi\n- hello")
  yaml.load("foo: 123\nbar: 456")
  yaml.load("- foo\n- bar\n- 3.14")
  yaml.load("foo: bar\n123: 456", as.named.list = FALSE)

## Not run: 
##D   # reading from a file (uses readLines internally)
##D   filename <- tempfile()
##D   cat("foo: 123", file=filename, sep="\n")
##D   yaml.load_file(filename)
## End(Not run)

  # custom scalar handler
  my.float.handler <- function(x) { as.numeric(x) + 123 }
  yaml.load("123.456", handlers=list("float#fix"=my.float.handler))

  # custom sequence handler
  yaml.load("- 1\n- 2\n- 3", handlers=list(seq=function(x) { as.integer(x) + 3 }))

  # custom map handler
  yaml.load("foo: 123", handlers=list(map=function(x) { x$foo <- x$foo + 123; x }))

  # handling custom types
  yaml.load("!sqrt 555", handlers=list(sqrt=function(x) { sqrt(as.integer(x)) }))
  yaml.load("!foo\n- 1\n- 2", handlers=list(foo=function(x) { as.integer(x) + 1 }))
  yaml.load("!bar\none: 1\ntwo: 2", handlers=list(foo=function(x) { x$one <- "one"; x }))

  # loading R expressions
  # NOTE: this will not be done by default in the near future
  doc <- yaml.load("inc: !expr function(x) x + 1")
  doc$inc(1)

  # adding a label to error messages
  try(yaml.load("*", error.label = "foo"))



