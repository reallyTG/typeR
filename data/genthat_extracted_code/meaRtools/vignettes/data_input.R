## ----rsetup-knitr,eval=TRUE,include=FALSE-----------------
require(knitr)
options(width=60)
opts_chunk$set(cache=TRUE)

## ---------------------------------------------------------
require(meaRtools)
show_top_file <- function(file) {
  cat(readLines(file, 10), sep='\n')
}

## ----comment=NA-------------------------------------------
times = system.file("extdata/textreader/wong1993_p0.times", package="meaRtools")
pos = system.file("extdata/textreader/wong1993_p0.pos", package="meaRtools")
show_top_file(times)
show_top_file(pos)

## ---------------------------------------------------------
hex_platelayout = list(n_well = 1, #number of wells 
                        wells = c("w1"), #names of those wells.
                        n_well_r = 1, # number of wells / row
                        n_well_c = 1, # number of wells / col
                        layout = c(1, 1), # layout when plotting
                        n_elec_r = 8,
                        n_elec_c = 8,
                        xlim = c(-400, 400), # xlimits for plotting
                        ylim = c(-400, 400), # ylimits for plotting
                        spacing = 50,  # distance (um) separating electrodes
                        corr_breaks = 0 # vector of correlation distances
                        )

add_plateinfo("hex-1well", hex_platelayout)
s = read_spikelist_text(times, pos, array="hex-1well")
meaRtools:::.plot_mealayout(s$layout, use_names = TRUE, cex=0.3)
meaRtools:::.plot_meanfiringrate(s, main = "Mean Firing Rate by Plate (Hz)")

## ---------------------------------------------------------
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

