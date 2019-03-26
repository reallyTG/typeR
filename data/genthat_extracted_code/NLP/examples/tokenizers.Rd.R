library(NLP)


### Name: tokenizers
### Title: Regexp tokenizers
### Aliases: Regexp_Tokenizer blankline_tokenizer whitespace_tokenizer
###   wordpunct_tokenizer

### ** Examples

## A simple text.
s <- String("  First sentence.  Second sentence.  ")
##           ****5****0****5****0****5****0****5**

spans <- whitespace_tokenizer(s)
spans
s[spans]

spans <- wordpunct_tokenizer(s)
spans
s[spans]



