library(sjPlot)


### Name: sjplot
### Title: Wrapper to create plots and tables within a pipe-workflow
### Aliases: sjplot sjtab

### ** Examples

library(dplyr)
data(efc)

# Frequency plot
sjplot(efc, e42dep, c172code, fun = "frq")

# Grouped frequencies
efc %>% sjplot(e42dep, c172code, fun = "grpfrq")

# Grouped frequencies, as box plots
efc %>% sjplot(e17age, c172code, fun = "grpfrq",
               type = "box", geom.colors = "Set1")

# frequencies, as plot grid
efc %>%
  select(e42dep, c172code, e16sex, c161sex) %>%
  sjplot() %>%
  plot_grid()

# plot grouped data frame
efc %>%
  group_by(e16sex, c172code) %>%
  select(e42dep, e16sex, c172code) %>%
  sjplot(wrap.title = 100) # no line break for subtitles

## Not run: 
##D # table output of grouped data frame
##D efc %>%
##D   group_by(e16sex, c172code) %>%
##D   select(e42dep, n4pstu, e16sex, c172code) %>%
##D   sjtab(fun = "xtab", use.viewer = FALSE) # open all tables in browser
## End(Not run)




