library(LexisNexisTools)


### Name: lnt_add
### Title: Adds or replaces articles
### Aliases: lnt_add

### ** Examples

# Make LNToutput object from sample
LNToutput <- lnt_read(lnt_sample())

# extract meta and make corrections
correction <- LNToutput@meta[grepl("Wikipedia", LNToutput@meta$Headline), ]
correction$Newspaper <- "Wikipedia"

# replace corrected meta information
LNToutput <- lnt_add(to = LNToutput, what = correction, where = "meta", replace = TRUE)



