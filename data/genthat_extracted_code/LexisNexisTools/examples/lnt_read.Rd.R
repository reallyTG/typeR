library(LexisNexisTools)


### Name: lnt_read
### Title: Read in a LexisNexis TXT file
### Aliases: lnt_read

### ** Examples

LNToutput <- lnt_read(lnt_sample())
meta.df <- LNToutput@meta
articles.df <- LNToutput@articles
paragraphs.df <- LNToutput@paragraphs



