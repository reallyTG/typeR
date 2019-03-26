library(wordspace)


### Name: t.dsm
### Title: Swap the Rows and Columns of a DSM Object (wordspace)
### Aliases: t.dsm

### ** Examples


tdm <- DSM_TermContext # term-document model
tdm$M

dtm <- t(tdm) # document-term model
dtm$M




