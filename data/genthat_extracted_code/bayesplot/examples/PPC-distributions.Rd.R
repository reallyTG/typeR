library(bayesplot)


### Name: PPC-distributions
### Title: PPC distributions
### Aliases: PPC-distributions ppc_data ppc_hist ppc_boxplot ppc_freqpoly
###   ppc_freqpoly_grouped ppc_dens ppc_dens_overlay ppc_ecdf_overlay
###   ppc_violin_grouped

### ** Examples

color_scheme_set("brightblue")
y <- example_y_data()
yrep <- example_yrep_draws()
dim(yrep)
ppc_dens_overlay(y, yrep[1:25, ])
## No test: 
ppc_ecdf_overlay(y, yrep[sample(nrow(yrep), 25), ])
## End(No test)

# for ppc_hist,dens,freqpoly,boxplot definitely use a subset yrep rows so
# only a few (instead of nrow(yrep)) histograms are plotted
ppc_hist(y, yrep[1:8, ])

## No test: 
color_scheme_set("red")
ppc_boxplot(y, yrep[1:8, ])

# wizard hat plot
color_scheme_set("blue")
ppc_dens(y, yrep[200:202, ])
## End(No test)

ppc_freqpoly(y, yrep[1:3,], alpha = 0.1, size = 1, binwidth = 5)

# if groups are different sizes then the 'freq' argument can be useful
group <- example_group_data()
ppc_freqpoly_grouped(y, yrep[1:3,], group) + yaxis_text()
## No test: 
ppc_freqpoly_grouped(y, yrep[1:3,], group, freq = FALSE) + yaxis_text()
## End(No test)

# don't need to only use small number of rows for ppc_violin_grouped
# (as it pools yrep draws within groups)
color_scheme_set("gray")
ppc_violin_grouped(y, yrep, group, size = 1.5)
## No test: 
ppc_violin_grouped(y, yrep, group, alpha = 0)

# change how y is drawn
ppc_violin_grouped(y, yrep, group, alpha = 0, y_draw = "points", y_size = 1.5)
ppc_violin_grouped(y, yrep, group, alpha = 0, y_draw = "both",
                   y_size = 1.5, y_alpha = 0.5, y_jitter = 0.33)
## End(No test)



