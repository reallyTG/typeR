library(sjPlot)


### Name: set_theme
### Title: Set global theme options for sjp-functions
### Aliases: set_theme

### ** Examples

## Not run: 
##D library(sjmisc)
##D data(efc)
##D # set sjPlot-defaults, a slightly modification
##D # of the ggplot base theme
##D set_theme()
##D 
##D # legends of all plots inside
##D set_theme(legend.pos = "top left", legend.inside = TRUE)
##D sjp.xtab(efc$e42dep, efc$e16sex)
##D 
##D # Use classic-theme. you may need to
##D # load the ggplot2-library.
##D library(ggplot2)
##D set_theme(base = theme_classic())
##D sjp.frq(efc$e42dep)
##D 
##D # adjust value labels
##D set_theme(
##D   geom.label.size = 3.5,
##D   geom.label.color = "#3366cc",
##D   geom.label.angle = 90
##D )
##D 
##D # hjust-aes needs adjustment for this
##D update_geom_defaults('text', list(hjust = -0.1))
##D sjp.xtab(efc$e42dep, efc$e16sex, vjust = "center", hjust = "center")
##D 
##D # Create own theme based on classic-theme
##D set_theme(
##D   base = theme_classic(), axis.linecolor = "grey50",
##D   axis.textcolor = "#6699cc"
##D )
##D sjp.frq(efc$e42dep)
## End(Not run)




