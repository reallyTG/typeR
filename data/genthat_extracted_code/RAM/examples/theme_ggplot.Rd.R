library(RAM)


### Name: theme_ggplot
### Title: Customized Themes For GGPLOT
### Aliases: RAM.border RAM.color
### Keywords: hplot

### ** Examples

## Not run: 
##D data(ITS1, ITS2, meta)
##D data <- list(ITS1=ITS1, ITS2=ITS2)
##D # dissim.alleig.plot returns a ggplot2 object:
##D my.eig.plot <- dissim.alleig.plot(data)
##D my.eig.plot # view the plot
##D # update ggplot theme
##D require("grid")
##D new_theme <-RAM.color()
##D my.eig.plot <- my.eig.plot + new_theme
##D my.eig.plot
## End(Not run)



