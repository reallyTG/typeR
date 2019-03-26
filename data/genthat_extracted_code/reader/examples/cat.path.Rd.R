library(reader)


### Name: cat.path
### Title: Simple and robust way to create full-path file names.
### Aliases: cat.path

### ** Examples

mydir <- "/Documents"
cat.path(mydir,"temp.doc")
# dir not added if one already present
cat.path(mydir,"/Downloads/me/temp.doc")
# using prefix and suffix
cat.path(mydir,"temp.doc","NEW",suf=5)
# changing the extension from .docx to .doc
cat.path(mydir,"temp.docx",ext="doc")



