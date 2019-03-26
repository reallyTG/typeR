library(Momocs)


### Name: coo_eccentricity
### Title: Calculates the eccentricity of a shape
### Aliases: coo_eccentricity coo_eccentricityeigen coo_eccentricity
###   coo_eccentricityeigen.default coo_eccentricity
###   coo_eccentricityeigen.Coo coo_eccentricity
###   coo_eccentricityboundingbox coo_eccentricity
###   coo_eccentricityboundingbox.default coo_eccentricity
###   coo_eccentricityboundingbox.Coo

### ** Examples

# coo_eccentricityeigen
bot[1] %>% coo_eccentricityeigen()
bot %>%
    slice(1:3) %>% # for speed sake only
    coo_eccentricityeigen()

# coo_eccentricityboundingbox
bot[1] %>% coo_eccentricityboundingbox()
bot %>%
    slice(1:3) %>% # for speed sake only
    coo_eccentricityboundingbox()



