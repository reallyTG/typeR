library(eikosograms)


### Name: eikos.default
### Title: Create a new eikosogram
### Aliases: eikos.default

### ** Examples

eikos("Hair", "Eye", data=HairEyeColor, legend = TRUE)
eikos("Hair", "Eye", data=HairEyeColor, 
      legend = TRUE, ylabs = FALSE, 
      yname_size = 16, yvals_size = 8)
eikos("Hair", "Eye", data=HairEyeColor, 
      legend = TRUE, ylabs = FALSE, 
      yprobs = seq(0.2, 1, .2))
eikos("Eye", "Hair", data=HairEyeColor, yprobs = seq(0,1,0.25),
      yname_size = 20, xname_size = 20,
      col = c("sienna4", "steelblue", "darkkhaki", "springgreen3"),
      lcol = "grey10",
      lock_aspect = FALSE)




