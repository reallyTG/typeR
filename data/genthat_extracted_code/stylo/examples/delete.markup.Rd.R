library(stylo)


### Name: delete.markup
### Title: Delete HTML or XML tags
### Aliases: delete.markup

### ** Examples

  delete.markup("Gallia est omnis <i>divisa</i> in partes tres", 
           markup.type = "html")

  delete.markup("Gallia<note>Gallia: Gaul.</note> est omnis 
           <emph>divisa</emph> in partes tres", markup.type = "xml")

  delete.markup("<speaker>Hamlet</speaker>Words, words, words...", 
           markup.type = "xml.drama")



