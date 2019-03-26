library(tokenizers)


### Name: basic-tokenizers
### Title: Basic tokenizers
### Aliases: basic-tokenizers tokenize_characters tokenize_words
###   tokenize_sentences tokenize_lines tokenize_paragraphs tokenize_regex
###   tokenize_tweets

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

tokenize_words(song)
tokenize_words(song, strip_punct = FALSE)
tokenize_sentences(song)
tokenize_paragraphs(song)
tokenize_lines(song)
tokenize_characters(song)
tokenize_tweets("@rOpenSci and #rstats see: https://cran.r-project.org",
                strip_punct = TRUE)
tokenize_tweets("@rOpenSci and #rstats see: https://cran.r-project.org",
                strip_punct = FALSE)



