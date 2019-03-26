library(Momocs)


### Name: coo_circularity
### Title: Calculates the Haralick's circularity of a shape
### Aliases: coo_circularity coo_circularity coo_circularity.default
###   coo_circularity coo_circularity.Coo coo_circularity
###   coo_circularityharalick coo_circularity
###   coo_circularityharalick.default coo_circularity
###   coo_circularityharalick.Coo coo_circularity coo_circularitynorm
###   coo_circularity coo_circularitynorm.default coo_circularity
###   coo_circularitynorm.Coo

### ** Examples


# coo_circularity
bot[1] %>% coo_circularity()
bot %>%
    slice(1:5) %>% # for speed sake only
    coo_circularity

# coo_circularityharalick
bot[1] %>% coo_circularityharalick()
bot %>%
    slice(1:5) %>% # for speed sake only
    coo_circularityharalick

# coo_circularitynorm
bot[1] %>% coo_circularitynorm()
bot %>%
    slice(1:5) %>% # for speed sake only
    coo_circularitynorm



