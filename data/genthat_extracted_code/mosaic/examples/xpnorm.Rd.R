library(mosaic)


### Name: xpnorm
### Title: Augmented versions of pnorm and qnorm
### Aliases: xpnorm xqnorm xcnorm

### ** Examples

xpnorm(650, 500, 100)
xqnorm(.75, 500, 100)
xpnorm(-3:3, return = "plot", system = "gg") %>% 
  gf_labs(title = "My Plot", x = "") %>% 
  gf_theme(theme_bw())

## Not run: 
##D if (rstudio_is_available() & require(manipulate)) {
##D   manipulate(xpnorm(score, 500, 100, verbose = verbose),
##D     score = slider(200, 800),
##D 	   verbose = checkbox(TRUE, label = "Verbose Output")
##D   )
##D }
## End(Not run)



