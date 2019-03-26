library(ggvis)


### Name: compute_bin
### Title: Bin data along a continuous variable
### Aliases: compute_bin

### ** Examples

mtcars %>% compute_bin(~mpg)
mtcars %>% compute_bin(~mpg, width = 10)
mtcars %>% group_by(cyl) %>% compute_bin(~mpg, width = 10)

# It doesn't matter whether you transform inside or outside of a vis
mtcars %>% compute_bin(~mpg) %>% ggvis(~x_, ~count_) %>% layer_paths()
mtcars %>% ggvis(~ x_, ~ count_) %>% compute_bin(~mpg) %>% layer_paths()

# Missing values get own bin
mtcars2 <- mtcars
mtcars2$mpg[sample(32, 5)] <- NA
mtcars2 %>% compute_bin(~mpg, width = 10)

# But are currently silently dropped in histograms
mtcars2 %>% ggvis() %>% layer_histograms(~mpg)



