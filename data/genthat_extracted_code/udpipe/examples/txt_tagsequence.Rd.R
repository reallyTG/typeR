library(udpipe)


### Name: txt_tagsequence
### Title: Identify a contiguous sequence of tags as 1 being entity
### Aliases: txt_tagsequence

### ** Examples

x <- data.frame(
  token = c("The", "chairman", "of", "the", "Nakitoma", "Corporation", 
           "Donald", "Duck", "went", "skiing", 
            "in", "the", "Niagara", "Falls"),
  upos = c("DET", "NOUN", "ADP", "DET", "PROPN", "PROPN", 
           "PROPN", "PROPN", "VERB", "VERB", 
           "ADP", "DET", "PROPN", "PROPN"),
  label = c("O", "O", "O", "O", "B-ORG", "I-ORG", 
            "B-PERSON", "I-PERSON", "O", "O", 
            "O", "O", "B-LOCATION", "I-LOCATION"), stringsAsFactors = FALSE)
x[, c("sequence_id", "group")] <- txt_tagsequence(x$upos)
x

##
## Define entity groups following the IOB scheme
## and combine B-LOC I-LOC I-LOC sequences as 1 group (e.g. New York City) 
groups <- list(
 Location = list(start = "B-LOC", labels = c("B-LOC", "I-LOC", "E-LOC")),
 Organisation =  list(start = "B-ORG", labels = c("B-ORG", "I-ORG", "E-ORG")),
 Person = list(start = "B-PER", labels = c("B-PER", "I-PER", "E-PER")), 
 Misc = list(start = "B-MISC", labels = c("B-MISC", "I-MISC", "E-MISC")))
x[, c("entity_id", "entity")] <- txt_tagsequence(x$label, groups)
x



