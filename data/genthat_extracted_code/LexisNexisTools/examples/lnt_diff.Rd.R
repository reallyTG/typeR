library(LexisNexisTools)


### Name: lnt_diff
### Title: Display diff of similar articles
### Aliases: lnt_diff

### ** Examples

# Test similarity of articles
duplicates.df <- lnt_similarity(LNToutput = lnt_read(lnt_sample()),
                                threshold = 0.95)

lnt_diff(duplicates.df, min = 0.18, max = 0.30)



