library(berryFunctions)


### Name: panelDim
### Title: Arrange panels in a multipanel plot (par mfrow)
### Aliases: panelDim
### Keywords: array dplot optimize

### ** Examples


# basic usage
op <- par(mfrow=panelDim(6))
for(i in 1:6) plot(i:10, main=i)
par(op)

# Adcanced options
panelDim(7)
g <- panelDim(7, all=TRUE)
panelDim(7, plot=TRUE)
panelDim(7, plot=TRUE, all=TRUE) # compares 4 best options

panelDim(26, all=TRUE)
panelDim(26, plot=TRUE, all=TRUE) # compares 4 best options
panelDim(26, plot=TRUE, all=TRUE, weight=c(3,0) ) # fewer empty panels

# effect of maxempty:
panelDim(13, plot=TRUE)             #  4 x 4
panelDim(13, maxempty=2, plot=TRUE) #  5 x 3
panelDim(13, maxempty=1, plot=TRUE) #  7 x 2
panelDim(13, maxempty=0, plot=TRUE) # 13 x 1

panelDim(45, plot=TRUE) # no empty panels
# focus on aspect ratio of each panel (make it as square as possible):
panelDim(45, weight=c(1,3), plot=TRUE) # better aspect for each panel

# Orientation of plot:
panelDim(45, plot=TRUE) # good for portrait orientation of plot
panelDim(45, landscape=TRUE, plot=TRUE) # better if plot width > height

## Not run: 
##D ## Rcmd check --as-cran doesn't like to open external devices,
##D ## so this example is excluded from running in the checks.
##D plot of several n with defaults
##D dev.new(record=TRUE)
##D for(i in 1:50)  panelDim(i, plot=TRUE)
## End(Not run)




