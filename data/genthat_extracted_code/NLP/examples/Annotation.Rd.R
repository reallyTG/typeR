library(NLP)


### Name: Annotation
### Title: Annotation objects
### Aliases: Annotation as.Annotation as.Annotation.Span is.Annotation
###   [.Annotation [[.Annotation $<-.Annotation as.data.frame.Annotation
###   as.list.Annotation c.Annotation duplicated.Annotation
###   format.Annotation length.Annotation merge.Annotation meta.Annotation
###   meta<-.Annotation names.Annotation print.Annotation subset.Annotation
###   unique.Annotation

### ** Examples

## A simple text.
s <- String("  First sentence.  Second sentence.  ")
##           ****5****0****5****0****5****0****5**

## Basic sentence and word token annotations for the text.
a1s <- Annotation(1 : 2,
                  rep.int("sentence", 2L),
                  c( 3L, 20L),
                  c(17L, 35L))
a1w <- Annotation(3 : 6,
                  rep.int("word", 4L),
                  c( 3L,  9L, 20L, 27L),
                  c( 7L, 16L, 25L, 34L))

## Use c() to combine these annotations:
a1 <- c(a1s, a1w)
a1
## Subscripting via '[':
a1[3 : 4]
## Subscripting via '$':
a1$type
## Subsetting according to slot values, directly:
a1[a1$type == "word"]
## or using subset():
subset(a1, type == "word")

## We can subscript string objects by annotation objects to extract the
## annotated substrings:
s[subset(a1, type == "word")]
## We can also subscript by lists of annotation objects:
s[annotations_in_spans(subset(a1, type == "word"),
                       subset(a1, type == "sentence"))]

## Suppose we want to add the sentence constituents (the ids of the
## words in the respective sentences) to the features of the sentence
## annotations.  The basic computation is
lapply(annotations_in_spans(a1[a1$type == "word"],
                            a1[a1$type == "sentence"]),
       function(a) a$id)
## For annotations, we need lists of feature lists:
features <-
    lapply(annotations_in_spans(a1[a1$type == "word"],
                                a1[a1$type == "sentence"]),
           function(e) list(constituents = e$id))
## Could add these directly:
a2 <- a1
a2$features[a2$type == "sentence"] <- features
a2
## Note how the print() method summarizes the features.
## We could also write a sentence constituent annotator
## (note that annotators should always have formals 's' and 'a', even
## though for computing the sentence constituents s is not needed):
sent_constituent_annotator <-
Annotator(function(s, a) {
              i <- which(a$type == "sentence")
              features <-
                  lapply(annotations_in_spans(a[a$type == "word"],
                                              a[i]),
                        function(e) list(constituents = e$id))
              Annotation(a$id[i], a$type[i], a$start[i], a$end[i],
                         features)
         })
sent_constituent_annotator(s, a1)
## Can use merge() to merge the annotations:
a2 <- merge(a1, sent_constituent_annotator(s, a1))
a2
## Equivalently, could have used
a2 <- annotate(s, sent_constituent_annotator, a1)
a2
## which merges automatically.



