library(annotate)


### Name: aqListGOIDs
### Title: List GO Identifiers by GO Ontology
### Aliases: aqListGOIDs
### Keywords: manip

### ** Examples

## all GO IDs in BP
bp_ids = aqListGOIDs("BP")
length(bp_ids)

## all GO IDs in BP or CC
bp_or_cc_ids = aqListGOIDs(c("BP", "CC"))
length(bp_or_cc_ids)



