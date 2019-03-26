library(udpipe)


### Name: udpipe_read_conllu
### Title: Read in a CONLL-U file as a data.frame
### Aliases: udpipe_read_conllu

### ** Examples

file_conllu <- system.file(package = "udpipe", "dummydata", "traindata.conllu")
x <- udpipe_read_conllu(file_conllu)
head(x)



