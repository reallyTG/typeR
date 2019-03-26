library(Momocs)


### Name: coo_perim
### Title: Calculates perimeter and variations
### Aliases: coo_perim coo_perimpts coo_perim coo_perimpts.default
###   coo_perim coo_perimpts.Coo coo_perim coo_perimcum coo_perim
###   coo_perimcum.default coo_perim coo_perimcum.Coo coo_perim coo_perim
###   coo_perim.default coo_perim coo_perim.Coo

### ** Examples

# for speed sake
b1 <- coo_sample(bot[1], 12)
b5 <- bot %>% slice(1:5) %>% coo_sample(12)

# coo_perim
coo_perim(b1)
coo_perim(b5)

# coo_perimpts
coo_perimpts(b1)
b5 %>% coo_perimpts()

# coo_perimcum
b1 %>% coo_perimcum()
b5 %>% coo_perimcum()



