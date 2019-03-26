library(mallet)


### Name: MalletLDA
### Title: Create a Mallet topic model trainer
### Aliases: MalletLDA

### ** Examples

## Not run: 
##D library(mallet)
##D 
##D ## Create a wrapper for the data with three elements, one for each column.
##D ##  R does some type inference, and will guess wrong, so give it hints with "colClasses".
##D ##  Note that "id" and "text" are special fields -- mallet will look there for input.
##D ##  "class" is arbitrary. We will only use that field on the R side.
##D documents <- read.table("nips_cvpr.txt", col.names=c("id", "class", "text"),
##D 	     		colClasses=rep("character", 3), sep="\t", quote="")
##D 
##D ## Create a mallet instance list object. Right now I have to specify the stoplist
##D ##  as a file, I can't pass in a list from R.
##D ## This function has a few hidden options (whether to lowercase, how we 
##D ##   define a token). See ?mallet.import for details.
##D mallet.instances <- mallet.import(documents$id, documents$text, "en.txt",
##D 		    		token.regexp = "\\p{L}[\\p{L}\\p{P}]+\\p{L}")
##D 
##D ## Create a topic trainer object.
##D topic.model <- MalletLDA(num.topics=20)
##D 
##D ## Load our documents. We could also pass in the filename of a 
##D ##  saved instance list file that we build from the command-line tools.
##D topic.model$loadDocuments(mallet.instances)
##D 
##D ## Get the vocabulary, and some statistics about word frequencies.
##D ##  These may be useful in further curating the stopword list.
##D vocabulary <- topic.model$getVocabulary()
##D word.freqs <- mallet.word.freqs(topic.model)
##D 
##D ## Optimize hyperparameters every 20 iterations, 
##D ##  after 50 burn-in iterations.
##D topic.model$setAlphaOptimization(20, 50)
##D 
##D ## Now train a model. Note that hyperparameter optimization is on, by default.
##D ##  We can specify the number of iterations. Here we'll use a large-ish round number.
##D topic.model$train(200)
##D 
##D ## NEW: run through a few iterations where we pick the best topic for each token, 
##D ##  rather than sampling from the posterior distribution.
##D topic.model$maximize(10)
##D 
##D ## Get the probability of topics in documents and the probability of words in topics.
##D ## By default, these functions return raw word counts. Here we want probabilities, 
##D ##  so we normalize, and add "smoothing" so that nothing has exactly 0 probability.
##D doc.topics <- mallet.doc.topics(topic.model, smoothed=T, normalized=T)
##D topic.words <- mallet.topic.words(topic.model, smoothed=T, normalized=T)
##D 
##D ## What are the top words in topic 7?
##D ##  Notice that R indexes from 1, so this will be the topic that mallet called topic 6.
##D mallet.top.words(topic.model, topic.words[7,])
##D 
##D ## Show the first few documents with at least 5##D 
##D head(documents[ doc.topics[7,] > 0.05 & doc.topics[10,] > 0.05, ])
##D 
##D ## How do topics differ across different sub-corpora?
##D nips.topic.words <- mallet.subset.topic.words(topic.model, documents$class == "NIPS",
##D 		    					   smoothed=T, normalized=T)
##D cvpr.topic.words <- mallet.subset.topic.words(topic.model, documents$class == "CVPR",
##D 		    					   smoothed=T, normalized=T)
##D 
##D ## How do they compare?
##D mallet.top.words(topic.model, nips.topic.words[10,])
##D mallet.top.words(topic.model, cvpr.topic.words[10,])
## End(Not run)



