library(NLP)


### Name: AnnotatedPlainTextDocument
### Title: Annotated Plain Text Documents
### Aliases: AnnotatedPlainTextDocument annotation

### ** Examples

## Use a pre-built annotated plain text document obtained by employing an
## annotator pipeline from package 'StanfordCoreNLP', available from the
## repository at <https://datacube.wu.ac.at>, using the following code:
##   require("StanfordCoreNLP")
##   s <- paste("Stanford University is located in California.",
##              "It is a great university.")
##   p <- StanfordCoreNLP_Pipeline(c("pos", "lemma", "parse"))
##   doc <- AnnotatedPlainTextDocument(s, p(s))

doc <- readRDS(system.file("texts", "stanford.rds", package = "NLP"))

doc

## Extract available annotation:
a <- annotation(doc)
a

## Structured views:
sents(doc)
tagged_sents(doc)
tagged_sents(doc, map = Universal_POS_tags_map)
parsed_sents(doc)

## Add (trivial) paragraph annotation:
s <- as.character(doc)
a <- annotate(s, Simple_Para_Token_Annotator(blankline_tokenizer), a)
doc <- AnnotatedPlainTextDocument(s, a)
## Structured view:
paras(doc)



