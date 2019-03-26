library(officer)


### Name: docx_summary
### Title: get Word content in a tidy format
### Aliases: docx_summary

### ** Examples

example_pptx <- system.file(package = "officer",
  "doc_examples/example.docx")
doc <- read_docx(example_pptx)
docx_summary(doc)



