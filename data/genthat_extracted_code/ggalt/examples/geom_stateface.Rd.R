library(ggalt)


### Name: geom_stateface
### Title: Use ProPublica's StateFace font in ggplot2 plots
### Aliases: geom_stateface

### ** Examples

## Not run: 
##D library(ggplot2)
##D library(ggalt)
##D 
##D # Run show_stateface() to see the location of the TTF StateFace font
##D # You need to install it for it to work
##D 
##D set.seed(1492)
##D dat <- data.frame(state=state.abb,
##D                   x=sample(100, 50),
##D                   y=sample(100, 50),
##D                   col=sample(c("#b2182b", "#2166ac"), 50, replace=TRUE),
##D                   sz=sample(6:15, 50, replace=TRUE),
##D                   stringsAsFactors=FALSE)
##D gg <- ggplot(dat, aes(x=x, y=y))
##D gg <- gg + geom_stateface(aes(label=state, color=col, size=sz))
##D gg <- gg + scale_color_identity()
##D gg <- gg + scale_size_identity()
##D gg
## End(Not run)



