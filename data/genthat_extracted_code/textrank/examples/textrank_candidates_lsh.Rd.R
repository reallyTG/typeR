library(textrank)


### Name: textrank_candidates_lsh
### Title: Use locality-sensitive hashing to get combinations of sentences
###   which contain words which are in the same minhash bucket
### Aliases: textrank_candidates_lsh

### ** Examples

library(textreuse)
library(udpipe)
lsh_probability(h = 1000, b = 500, s = 0.1) # A 10 percent Jaccard overlap will be detected well

minhash <- minhash_generator(n = 1000, seed = 123456789)

data(joboffer)
joboffer$textrank_id <- unique_identifier(joboffer, c("doc_id", "paragraph_id", "sentence_id"))
sentences <- unique(joboffer[, c("textrank_id", "sentence")])
terminology <- subset(joboffer, upos %in% c("NOUN", "ADJ"), select = c("textrank_id", "lemma"))
candidates <- textrank_candidates_lsh(x = terminology$lemma, sentence_id = terminology$textrank_id,
                                      minhashFUN = minhash, bands = 500)
head(candidates)
tr <- textrank_sentences(data = sentences, terminology = terminology,
                         textrank_candidates = candidates)
summary(tr, n = 2)



