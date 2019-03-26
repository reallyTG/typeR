## ------------------------------------------------------------------------
library('burnr')

## ------------------------------------------------------------------------
data(lgr2)  # fire data from Los Griegos Peak, New Mexico

head(lgr2)

## ------------------------------------------------------------------------
str(lgr2)

## ------------------------------------------------------------------------
data(pgm)  # Peggy Mesa fire data.

both <- lgr2 + pgm

## ------------------------------------------------------------------------
series_names(lgr2)

series_names(both)

## ------------------------------------------------------------------------
plot(lgr2)

## ------------------------------------------------------------------------
plot(lgr2, ylabels = FALSE)

## ------------------------------------------------------------------------
data(lgr2_meta)

head(lgr2_meta)

## ------------------------------------------------------------------------
plot(lgr2,
     color_group = lgr2_meta$SpeciesID,
     color_id = lgr2_meta$TreeID,
     ylabels = FALSE,
     plot_legend = TRUE)  # Include a legend!

## ------------------------------------------------------------------------
plot(lgr2,
     facet_group = lgr2_meta$SpeciesID,
     facet_id = lgr2_meta$TreeID,
     ylabels = FALSE)

## ------------------------------------------------------------------------
library(ggplot2)
p <- plot_demograph(lgr2,
             color_group = lgr2_meta$SpeciesID,
             color_id = lgr2_meta$TreeID)
print(p)

## ------------------------------------------------------------------------
# Add transparent box as annotation to plot.
p + annotate('rect',
          xmin = 1750, xmax = 1805,
          ymin = 3.5, ymax = 13.5, alpha = 0.2)

## ------------------------------------------------------------------------
p + annotate('text', x = 1650, y = 7.5, label = 'important!')

