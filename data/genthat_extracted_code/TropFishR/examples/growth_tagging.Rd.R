library(TropFishR)


### Name: growth_tagging
### Title: Growth from tagging data
### Aliases: growth_tagging

### ** Examples

# from Wolff (1984)
dat <- list(L1 = c(40,46,29,30,18,31,48,49,59,58,61,65,57,55),
   L2 = c(85,53,55,56,25,43,70,59,62,80,72,83,65,56),
   delta_t = c(289,26,84,77,14,38,89,38,28,149,89,74,38,21))
growth_tagging(param = dat, "Munro", time_unit = "day", Linf_range=c(80,120))
growth_tagging(param = dat, "GullandHolt", time_unit = "day")


# from Sparre and Venema (1999)
dat <- list(L1 = c(9.7,10.5,10.9,11.1,12.4,12.8,14.0,16.1,16.3,17.0,17.7),
   L2 = c(10.2,10.9,11.8,12.0,15.5,13.6,14.3,16.4,16.5,17.2,18.0),
   delta_t = c(53,33,108,102,272,48,53,73,63,106,111))
growth_tagging(param = dat, "Munro", time_unit = "day", Linf_range = c(10,40))
growth_tagging(param = dat, "GullandHolt", time_unit = "day")




