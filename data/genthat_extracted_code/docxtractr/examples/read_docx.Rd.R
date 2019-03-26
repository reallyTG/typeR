library(docxtractr)


### Name: read_docx
### Title: Read in a Word document for table extraction
### Aliases: read_docx

### ** Examples

doc <- read_docx(system.file("examples/data.docx", package="docxtractr"))
class(doc)

doc <- read_docx(
  system.file("examples/trackchanges.docx", package="docxtractr"),
  track_changes = "accept"
)

## Not run: 
##D # from a URL
## End(Not run)



