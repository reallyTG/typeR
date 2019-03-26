library(udpipe)


### Name: udpipe_train
### Title: Train a UDPipe model
### Aliases: udpipe_train

### ** Examples

## You need to have a file on disk in CONLL-U format, taking the toy example file put in the package
file_conllu <- system.file(package = "udpipe", "dummydata", "traindata.conllu")
file_conllu
cat(head(readLines(file_conllu), 3), sep="\n")

## Not run: 
##D ##
##D ## This is a toy example showing how to build a model, it is not a good model whatsoever, 
##D ##   because model building takes more than 5 seconds this model is saved also in 
##D ##   the file at system.file(package = "udpipe", "dummydata", "toymodel.udpipe")
##D ##
##D m <- udpipe_train(file = "toymodel.udpipe", files_conllu_training = file_conllu, 
##D   annotation_tokenizer = list(dimension = 16, epochs = 1, batch_size = 100, dropout = 0.7), 
##D   annotation_tagger = list(iterations = 1, models = 1, 
##D      provide_xpostag = 1, provide_lemma = 0, provide_feats = 0, 
##D      guesser_suffix_rules = 2, guesser_prefix_min_count = 2), 
##D   annotation_parser = list(iterations = 2, 
##D      embedding_upostag = 20, embedding_feats = 20, embedding_xpostag = 0, embedding_form = 50, 
##D      embedding_lemma = 0, embedding_deprel = 20, learning_rate = 0.01, 
##D      learning_rate_final = 0.001, l2 = 0.5, hidden_layer = 200, 
##D      batch_size = 10, transition_system = "projective", transition_oracle = "dynamic", 
##D      structured_interval = 10))
## End(Not run)

file_model <- system.file(package = "udpipe", "dummydata", "toymodel.udpipe")
ud_toymodel <- udpipe_load_model(file_model)
x <- udpipe_annotate(object = ud_toymodel, x = "Ik ging deze morgen naar de bakker brood halen.")
x <- as.data.frame(x)

##
## The above was a toy example showing how to build a model, if you want real-life scenario's
## look at the training parameter examples given below and train it on your CONLL-U file
##
## Example training arguments used for the models available at udpipe_download_model
data(udpipe_annotation_params)
head(udpipe_annotation_params$tokenizer)
head(udpipe_annotation_params$tagger)
head(udpipe_annotation_params$parser)
## Not run: 
##D ## More details in the package vignette:
##D vignette("udpipe-train", package = "udpipe")
## End(Not run)



