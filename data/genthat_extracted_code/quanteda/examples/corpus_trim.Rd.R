library(quanteda)


### Name: corpus_trim
### Title: Remove sentences based on their token lengths or a pattern match
### Aliases: corpus_trim char_trim
### Keywords: character corpus

### ** Examples

txt <- c("PAGE 1. This is a single sentence.  Short sentence. Three word sentence.",
         "PAGE 2. Very short! Shorter.",
         "Very long sentence, with multiple parts, separated by commas.  PAGE 3.")
mycorp <- corpus(txt, docvars = data.frame(serial = 1:3))
texts(mycorp)

# exclude sentences shorter than 3 tokens
texts(corpus_trim(mycorp, min_ntoken = 3))
# exclude sentences that start with "PAGE <digit(s)>"
texts(corpus_trim(mycorp, exclude_pattern = "^PAGE \\d+"))

# trimming character objects
char_trim(txt, "sentences", min_ntoken = 3)
char_trim(txt, "sentences", exclude_pattern = "sentence\\.")



