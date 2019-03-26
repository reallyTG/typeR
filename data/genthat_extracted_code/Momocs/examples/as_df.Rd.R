library(Momocs)


### Name: as_df
### Title: Converts Momocs objects to data.frames
### Aliases: as_df as_df.Coo as_df.Coe as_df.TraCoe as_df.PCA as_df.LDA

### ** Examples

# smaller Out
lite_bot <- bot %>% slice(c(1, 2, 21, 22)) %>% coo_sample(12)
# Coo object
lite_bot %>% as_df %>% head
# Coe object
lite_bot %>% efourier(2) %>% as_df %>% head
# PCA object
lite_bot %>% efourier(2) %>% PCA %>% as_df %>% head
# LDA object
lite_bot %>% efourier(2) %>% PCA %>% LDA(~type) %>% as_df %>% head



