library(EML)


### Name: get_TextType
### Title: get_TextType
### Aliases: get_TextType

### ** Examples

## No test: 

## Convert an EML abstract to markdown
f <- system.file("examples/hf205.xml", package = "EML")
eml <- read_eml(f)
abstract <- eml_get(eml, "abstract")
get_TextType(abstract[[1]], "markdown", "abstract.markdown")
readLines("abstract.markdown")
unlink("abstract.markdown") # tidy up

## Turn a docx file into EML abstract and preview at HTML
f <- system.file("examples/hf205-abstract.docx", package = "EML")
a <- as(set_TextType(f), "abstract")
get_TextType(a)
## End(No test)




