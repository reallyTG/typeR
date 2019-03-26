library(officer)


### Name: pptx_summary
### Title: get PowerPoint content in a tidy format
### Aliases: pptx_summary

### ** Examples

example_pptx <- system.file(package = "officer",
  "doc_examples/example.pptx")
doc <- read_pptx(example_pptx)
pptx_summary(doc)



