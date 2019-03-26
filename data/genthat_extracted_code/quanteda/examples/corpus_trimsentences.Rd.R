library(quanteda)


### Name: corpus_trimsentences
### Title: Remove sentences based on their token lengths or a pattern match
### Aliases: corpus_trimsentences char_trimsentences
### Keywords: deprecated internal

### ** Examples

txt <- c("PAGE 1. A single sentence.  Short sentence. Three word sentence.",
         "PAGE 2. Very short! Shorter.",
         "Very long sentence, with three parts, separated by commas.  PAGE 3.")
mycorp <- corpus(txt, docvars = data.frame(serial = 1:3))
texts(mycorp)

# exclude sentences shorter than 3 tokens
texts(corpus_trimsentences(mycorp, min_length = 3))
# exclude sentences that start with "PAGE <digit(s)>"
texts(corpus_trimsentences(mycorp, exclude_pattern = "^PAGE \\d+"))

# on a character
char_trimsentences(txt, min_length = 3)
char_trimsentences(txt, min_length = 3)
char_trimsentences(txt, exclude_pattern = "sentence\\.")



