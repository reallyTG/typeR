library(udpipe)


### Name: udpipe_accuracy
### Title: Evaluate the accuracy of your UDPipe model on holdout data
### Aliases: udpipe_accuracy

### ** Examples

x <- udpipe_download_model(language = "dutch-lassysmall")
ud_dutch <- udpipe_load_model(x$file_model)

file_conllu <- system.file(package = "udpipe", "dummydata", "traindata.conllu")
metrics <- udpipe_accuracy(ud_dutch, file_conllu)
metrics$accuracy
metrics <- udpipe_accuracy(ud_dutch, file_conllu, 
                           tokenizer = "none", tagger = "default", parser = "default")
metrics$accuracy
metrics <- udpipe_accuracy(ud_dutch, file_conllu, 
                           tokenizer = "none", tagger = "none", parser = "default")
metrics$accuracy
metrics <- udpipe_accuracy(ud_dutch, file_conllu, 
                           tokenizer = "default", tagger = "none", parser = "none")
metrics$accuracy

## cleanup for CRAN only - you probably want to keep your model if you have downloaded it
file.remove("dutch-lassysmall-ud-2.0-170801.udpipe")



