library(LexisNexisTools)


### Name: lnt_lookup
### Title: Lookup keywords in articles
### Aliases: lnt_lookup

### ** Examples

# Make LNToutput object from sample
LNToutput <- lnt_read(lnt_sample())

# Lookup keywords
LNToutput@meta$Keyword <- lnt_lookup(LNToutput,
                                     "statistical computing")

# Keep only articles which mention the keyword
LNToutput_stat <- LNToutput[!sapply(LNToutput@meta$Keyword, is.null)]

# Covert list of keywords to string
LNToutput@meta$Keyword <- sapply(LNToutput@meta$Keyword, toString)



