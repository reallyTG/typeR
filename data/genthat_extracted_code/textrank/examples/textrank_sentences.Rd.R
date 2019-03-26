library(textrank)


### Name: textrank_sentences
### Title: Textrank - extract relevant sentences
### Aliases: textrank_sentences

### ** Examples

library(udpipe)
data(joboffer)
head(joboffer)
joboffer$textrank_id <- unique_identifier(joboffer, c("doc_id", "paragraph_id", "sentence_id"))
sentences <- unique(joboffer[, c("textrank_id", "sentence")])
cat(sentences$sentence)
terminology <- subset(joboffer, upos %in% c("NOUN", "ADJ"), select = c("textrank_id", "lemma"))
head(terminology)

## Textrank for finding the most relevant sentences
tr <- textrank_sentences(data = sentences, terminology = terminology)
summary(tr, n = 2)
summary(tr, n = 5, keep.sentence.order = TRUE)

## Not run: 
##D ## Using minhash to reduce sentence combinations - relevant if you have a lot of sentences
##D library(textreuse)
##D minhash <- minhash_generator(n = 1000, seed = 123456789)
##D candidates <- textrank_candidates_lsh(x = terminology$lemma, sentence_id = terminology$textrank_id,
##D                                       minhashFUN = minhash, bands = 500)
##D tr <- textrank_sentences(data = sentences, terminology = terminology,
##D                          textrank_candidates = candidates)
##D summary(tr, n = 2)
## End(Not run)
## You can also reduce the number of sentence combinations by sampling
tr <- textrank_sentences(data = sentences, terminology = terminology, max = 100)
tr
summary(tr, n = 2)



