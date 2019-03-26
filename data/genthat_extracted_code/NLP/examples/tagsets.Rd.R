library(NLP)


### Name: tagsets
### Title: NLP Tag Sets
### Aliases: Penn_Treebank_POS_tags Brown_POS_tags Universal_POS_tags
###   Universal_POS_tags_map

### ** Examples

## Penn Treebank POS tags
dim(Penn_Treebank_POS_tags)
## Inspect first 20 entries:
write.dcf(head(Penn_Treebank_POS_tags, 20L))

## Brown POS tags
dim(Brown_POS_tags)
## Inspect first 20 entries:
write.dcf(head(Brown_POS_tags, 20L))

## Universal POS tags
Universal_POS_tags

## Available mappings to universal POS tags
names(Universal_POS_tags_map)



