library(Momocs)


### Name: coo_rectilinearity
### Title: Calculates the rectilinearity of a shape
### Aliases: coo_rectilinearity

### ** Examples

bot[1] %>%
    coo_sample(32) %>% # for speed sake only
    coo_rectilinearity

bot %>%
    slice(1:3) %>% coo_sample(32) %>% # for speed sake only
    coo_rectilinearity



