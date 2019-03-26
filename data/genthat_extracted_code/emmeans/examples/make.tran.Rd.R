library(emmeans)


### Name: make.tran
### Title: Response-transformation extensions
### Aliases: make.tran

### ** Examples

# Fit a model using an oddball transformation:
bctran <- make.tran("boxcox", 0.368)
warp.bc <- with(bctran, 
    lm(linkfun(breaks) ~ wool * tension, data = warpbreaks))
# Obtain back-transformed LS means:    
emmeans(warp.bc, ~ tension | wool, type = "response")

## Not run: 
##D # An existing model 'mod' was fitted with a log(y + 1) transformation...
##D mod.rg <- update(ref_grid(mod), tran = make.tran("genlog", 1))
##D emmeans(mod.rg, "treatment")
## End(Not run)



