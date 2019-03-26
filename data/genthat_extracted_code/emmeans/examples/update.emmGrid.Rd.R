library(emmeans)


### Name: update.emmGrid
### Title: Update an 'emmGrid' object
### Aliases: update.emmGrid

### ** Examples

# Using an already-transformed response:
mypigs <- transform(pigs, logconc = log(pigs$conc))
mypigs.lm <- lm(logconc ~ source + factor(percent), data = mypigs)

# Reference grid that knows about the transformation:
mypigs.rg <- update(ref_grid(mypigs.lm), tran = "log", 
                    predict.type = "response")
emmeans(mypigs.rg, "source")



