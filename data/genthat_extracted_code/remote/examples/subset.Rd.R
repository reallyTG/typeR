library(remote)


### Name: subset
### Title: Subset modes in EotStacks
### Aliases: [[,EotStack,ANY,ANY-method subset subset,EotStack-method

### ** Examples

data(vdendool)

nh_modes <- eot(x = vdendool, y = NULL, n = 3, 
                standardised = FALSE, 
                verbose = TRUE)
                
subs <- subset(nh_modes, 2:3) # is the same as
subs <- nh_modes[[2:3]]

## effect of 'drop=FALSE' when selecting a single layer
subs <- subset(nh_modes, 2)
class(subs)
subs <- subset(nh_modes, 2, drop = TRUE)
class(subs)




