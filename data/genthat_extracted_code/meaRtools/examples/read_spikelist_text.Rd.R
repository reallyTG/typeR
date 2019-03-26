library(meaRtools)


### Name: read_spikelist_text
### Title: Construct an MEA object by importing from text files.
### Aliases: read_spikelist_text

### ** Examples

## No test: 
demas_platelayout = list(n_well = 6,
                        wells = paste0("w", 1:6),
                        n_well_r = 2,
                        n_well_c = 3,
                        layout = c(3, 2),
                        n_elec_r = 8,
                        n_elec_c = 8,
                        xlim = c(-100, 7200),
                        ylim = c(0, 6000),
                        spacing = 200,
                        corr_breaks = 0
                        )
add_plateinfo("demas-6well", demas_platelayout)
times = system.file("extdata/textreader/demas.times", package="meaRtools")
pos = system.file("extdata/textreader/demas.pos", package="meaRtools")
s = read_spikelist_text(times, pos, array="demas-6well")
meaRtools:::.plot_mealayout(s$layout, use_names = TRUE, cex=0.3)
## End(No test)



