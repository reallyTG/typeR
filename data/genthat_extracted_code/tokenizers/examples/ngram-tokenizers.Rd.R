library(tokenizers)


### Name: ngram-tokenizers
### Title: N-gram tokenizers
### Aliases: ngram-tokenizers tokenize_ngrams tokenize_skip_ngrams

### ** Examples

song <-  paste0("How many roads must a man walk down\n",
                "Before you call him a man?\n",
                "How many seas must a white dove sail\n",
                "Before she sleeps in the sand?\n",
                "\n",
                "How many times must the cannonballs fly\n",
                "Before they're forever banned?\n",
                "The answer, my friend, is blowin' in the wind.\n",
                "The answer is blowin' in the wind.\n")

tokenize_ngrams(song, n = 4)
tokenize_ngrams(song, n = 4, n_min = 1)
tokenize_skip_ngrams(song, n = 4, k = 2)



