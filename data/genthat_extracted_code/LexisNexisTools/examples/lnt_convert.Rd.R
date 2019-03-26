library(LexisNexisTools)


### Name: lnt_convert
### Title: Convert LNToutput to other formats
### Aliases: lnt_convert lnt2rDNA lnt2quanteda lnt2tm lnt2cptools
###   lnt2SQLite

### ** Examples

LNToutput <- lnt_read(lnt_sample())

docs <- lnt_convert(LNToutput, to = "rDNA")

corpus <- lnt_convert(LNToutput, to = "quanteda")

dbloc <- lnt_convert(LNToutput, to = "lnt2SQLite")

tCorpus <- lnt_convert(LNToutput, to = "corpustools")

tidy <- lnt_convert(LNToutput, to = "tidytext")

Corpus <- lnt_convert(LNToutput, to = "tm")



