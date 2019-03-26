library(WordR)


### Name: renderInlineCode
### Title: Read Word document with R code blocks, evaluate them and writes
###   the result into another Word document.
### Aliases: renderInlineCode

### ** Examples

renderInlineCode(
  paste(examplePath(),'templates/template1.docx',sep = ''),
  paste(tempdir(),'/result1.docx',sep = ''))




