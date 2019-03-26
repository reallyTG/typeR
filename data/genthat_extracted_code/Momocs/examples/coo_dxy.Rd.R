library(Momocs)


### Name: coo_dxy
### Title: Calculate abscissa and ordinate on a shape
### Aliases: coo_dxy

### ** Examples

coo_dxy(coo_sample(bot[1], 12))

bot %>%
    slice(1:5) %>% coo_sample(12) %>%  # for readability and speed only
    coo_dxy()



