library(udpipe)


### Name: as_conllu
### Title: Convert a data.frame to CONLL-U format
### Aliases: as_conllu

### ** Examples

file_conllu <- system.file(package = "udpipe", "dummydata", "traindata.conllu")
x <- udpipe_read_conllu(file_conllu)
str(x)
conllu <- as_conllu(x)
cat(conllu)
## Not run: 
##D ## Write it to file, making sure it is in UTF-8
##D cat(as_conllu(x), file = file("annotations.conllu", encoding = "UTF-8"))
## End(Not run)

## Some fields are not mandatory, they will assummed to be NA
conllu <- as_conllu(x[, c('doc_id', 'sentence_id', 'sentence', 
                          'token_id', 'token', 'upos')])
cat(conllu)



