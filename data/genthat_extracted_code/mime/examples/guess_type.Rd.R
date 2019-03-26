library(mime)


### Name: guess_type
### Title: Guess the MIME types from filenames
### Aliases: guess_type

### ** Examples

library(mime)
# well-known file types
guess_type(c("a/b/c.html", "d.pdf", "e.odt", "foo.docx", "tex"))
# not in the standard table, but in mimeextra
guess_type(c("a.md", "b.R"), mime_extra = NULL)
guess_type(c("a.md", "b.R"))

# override the standard MIME table (tex is text/x-tex by default)
guess_type("tex", mime_extra = c(tex = "text/plain"))
# unknown extension 'bar'
guess_type("foo.bar")
# force unknown types to be plain text
guess_type("foo.bar", unknown = "text/plain")

# empty file extension
guess_type("Makefile")
# we know it is a plain text file
guess_type("Makefile", empty = "text/plain")

# subtypes
guess_type(c("abc.html", "def.htm"), subtype = c("charset=UTF-8", ""))



