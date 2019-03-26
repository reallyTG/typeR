library(PKPDmisc)


### Name: chunk_df
### Title: chunk dataframes so easy to split for parallel processing
### Aliases: chunk_df

### ** Examples

library(dplyr)
Theoph %>% chunk_df()

Theoph %>% group_by(Subject) %>% chunk_df()
Theoph %>% chunk_df(Subject)
Theoph %>% chunk_df(c("Subject"))

Theoph %>% chunk_df(Subject, .nchunks = 3)



