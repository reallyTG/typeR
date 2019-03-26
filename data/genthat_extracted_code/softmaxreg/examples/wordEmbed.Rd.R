library(softmaxreg)


### Name: wordEmbed
### Title: Embed Words to Vectors Using Pre-trained Word2vec Dictionary
### Aliases: wordEmbed

### ** Examples

data(word2vec) # load default 20 dimensions word2vec dataset
doc = "This is an example line of document"
docVectors = wordEmbed(doc, word2vec, meanVec = TRUE)



