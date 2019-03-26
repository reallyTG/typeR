library(tokenizers)


### Name: tokenize_word_stems
### Title: Word stem tokenizer
### Aliases: tokenize_word_stems

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

tokenize_word_stems(song)



