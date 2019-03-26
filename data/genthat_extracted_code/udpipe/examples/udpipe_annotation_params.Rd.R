library(udpipe)


### Name: udpipe_annotation_params
### Title: List with training options set by the UDPipe community when
###   building models based on the Universal Dependencies data
### Aliases: udpipe_annotation_params

### ** Examples

data(udpipe_annotation_params)
str(udpipe_annotation_params)

## settings of the tokenizer
head(udpipe_annotation_params$tokenizer)

## settings of the tagger
subset(udpipe_annotation_params$tagger, language_treebank == "nl")

## settings of the parser
udpipe_annotation_params$parser



