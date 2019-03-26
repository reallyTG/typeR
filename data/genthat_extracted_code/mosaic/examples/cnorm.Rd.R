library(mosaic)


### Name: cnorm
### Title: Central Probability in a Normal or T Distribution
### Aliases: cnorm ct

### ** Examples

qnorm(.975)
cnorm(.95)
xcnorm(.95)
xcnorm(.95, verbose = FALSE, return = "plot") %>%
  gf_refine(
  scale_fill_manual( values = c("navy", "limegreen")),
  scale_color_manual(values = c("black", "black")))
cnorm(.95, mean = 100, sd = 10)
xcnorm(.95, mean = 100, sd = 10)




