library(NLP)


### Name: Annotator
### Title: Annotator (pipeline) objects
### Aliases: Annotator Annotator_Pipeline as.Annotator_Pipeline

### ** Examples

## Use blankline_tokenizer() for a simple paragraph token annotator:
para_token_annotator <-
Annotator(function(s, a = Annotation()) {
              spans <- blankline_tokenizer(s)
              n <- length(spans)
              ## Need n consecutive ids, starting with the next "free"
              ## one:
              from <- next_id(a$id)
              Annotation(seq(from = from, length.out = n),
                         rep.int("paragraph", n),
                         spans$start,
                         spans$end)
          },
          list(description = 
              "A paragraph token annotator based on blankline_tokenizer()."))
para_token_annotator
## Alternatively, use Simple_Para_Token_Annotator().

## A simple text with two paragraphs:
s <- String(paste("  First sentence.  Second sentence.  ",
                  "  Second paragraph.  ",
                  sep = "\n\n"))
a <- annotate(s, para_token_annotator)
## Annotations for paragraph tokens.
a
## Extract paragraph tokens.
s[a]



