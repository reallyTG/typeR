library(fastrtext)


### Name: execute
### Title: Execute command on 'fastText' model (including training)
### Aliases: execute

### ** Examples

## Not run: 
##D # Supervised learning example
##D library(fastrtext)
##D 
##D data("train_sentences")
##D data("test_sentences")
##D 
##D # prepare data
##D tmp_file_model <- tempfile()
##D 
##D train_labels <- paste0("__label__", train_sentences[,"class.text"])
##D train_texts <- tolower(train_sentences[,"text"])
##D train_to_write <- paste(train_labels, train_texts)
##D train_tmp_file_txt <- tempfile()
##D writeLines(text = train_to_write, con = train_tmp_file_txt)
##D 
##D test_labels <- paste0("__label__", test_sentences[,"class.text"])
##D test_texts <- tolower(test_sentences[,"text"])
##D test_to_write <- paste(test_labels, test_texts)
##D 
##D # learn model
##D execute(commands = c("supervised", "-input", train_tmp_file_txt,
##D                      "-output", tmp_file_model, "-dim", 20, "-lr", 1,
##D                      "-epoch", 20, "-wordNgrams", 2, "-verbose", 1))
##D 
##D model <- load_model(tmp_file_model)
##D predict(model, sentences = test_sentences[1, "text"])
##D 
##D # Unsupervised learning example
##D library(fastrtext)
##D 
##D data("train_sentences")
##D data("test_sentences")
##D texts <- tolower(train_sentences[,"text"])
##D tmp_file_txt <- tempfile()
##D tmp_file_model <- tempfile()
##D writeLines(text = texts, con = tmp_file_txt)
##D execute(commands = c("skipgram", "-input", tmp_file_txt, "-output", tmp_file_model, "-verbose", 1))
##D 
##D model <- load_model(tmp_file_model)
##D dict <- get_dictionary(model)
##D get_word_vectors(model, head(dict, 5))
## End(Not run)



