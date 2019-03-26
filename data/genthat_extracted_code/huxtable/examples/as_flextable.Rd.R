library(huxtable)


### Name: as_FlexTable
### Title: Convert a huxtable for Word/Powerpoint
### Aliases: as_FlexTable as_flextable as_flextable.huxtable

### ** Examples

ht <- hux(a = 1:3, b = 1:3)
ft <- as_flextable(ht)
## Not run: 
##D   my_doc <- officer::read_docx()
##D   my_doc <- flextable::body_add_flextable(
##D         my_doc, ft)
##D   print(my_doc, target =
##D         "path/to/my_doc.docx")
## End(Not run)



