library(cleanNLP)


### Name: cnlp_write_conll
### Title: Returns a CoNLL-U Document
### Aliases: cnlp_write_conll

### ** Examples

## Not run: 
##D for (i in cnlp_get_document(obama)$id) {
##D   anno <- extract_documents(obama, i)
##D   conll <- cnlp_write_conll(anno)
##D   writeLines(conll, sprintf("%02d.conll", i))
##D }
## End(Not run)




