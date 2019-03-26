library(poppr)


### Name: genotype_curve
### Title: Produce a genotype accumulation curve
### Aliases: genotype_curve

### ** Examples

data(nancycats)
nan_geno <- genotype_curve(nancycats)
## Not run: 
##D 
##D # Marker Type Comparison --------------------------------------------------
##D # With AFLP data, it is often necessary to include more markers for resolution
##D data(Aeut)
##D Ageno <- genotype_curve(Aeut)
##D 
##D # Many microsatellite data sets have hypervariable markers
##D data(microbov)
##D mgeno <- geotype_curve(microbov)
##D 
##D # Adding a trendline ------------------------------------------------------
##D 
##D # Trendlines: you can add a smoothed trendline with geom_smooth()
##D library("ggplot2")
##D p <- last_plot()
##D p + geom_smooth()
##D 
##D # Producing Figures for Publication ---------------------------------------
##D 
##D # This data set has been pre filtered
##D data(monpop)
##D mongeno <- genotype_curve(monpop)
##D 
##D # Here, we add a curve and a title for publication
##D p <- last_plot()
##D mytitle <- expression(paste("Genotype Accumulation Curve for ", 
##D                             italic("M. fructicola")))
##D p + geom_smooth() + 
##D   theme_bw() + 
##D   theme(text = element_text(size = 12, family = "serif")) +
##D   theme(title = element_text(size = 14)) +
##D   ggtitle(mytitle)
## End(Not run)




