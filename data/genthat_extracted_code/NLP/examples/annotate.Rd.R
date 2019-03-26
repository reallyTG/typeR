library(NLP)


### Name: annotate
### Title: Annotate text strings
### Aliases: annotate

### ** Examples

## A simple text.
s <- String("  First sentence.  Second sentence.  ")
##           ****5****0****5****0****5****0****5**

## A very trivial sentence tokenizer.
sent_tokenizer <-
function(s) {
    s <- as.String(s)
    m <- gregexpr("[^[:space:]][^.]*\\.", s)[[1L]]
    Span(m, m + attr(m, "match.length") - 1L)
}
## (Could also use Regexp_Tokenizer() with the above regexp pattern.)
## A simple sentence token annotator based on the sentence tokenizer.
sent_token_annotator <- Simple_Sent_Token_Annotator(sent_tokenizer)

## Annotate sentence tokens.
a1 <- annotate(s, sent_token_annotator)
a1

## A very trivial word tokenizer.
word_tokenizer <-
function(s) {
    s <- as.String(s)
    ## Remove the last character (should be a period when using
    ## sentences determined with the trivial sentence tokenizer).
    s <- substring(s, 1L, nchar(s) - 1L)
    ## Split on whitespace separators.
    m <- gregexpr("[^[:space:]]+", s)[[1L]]
    Span(m, m + attr(m, "match.length") - 1L)
}
## A simple word token annotator based on the word tokenizer.
word_token_annotator <- Simple_Word_Token_Annotator(word_tokenizer)

## Annotate word tokens using the already available sentence token
## annotations.
a2 <- annotate(s, word_token_annotator, a1)
a2

## Can also perform sentence and word token annotations in a pipeline:
p <- Annotator_Pipeline(sent_token_annotator, word_token_annotator)
annotate(s, p)



