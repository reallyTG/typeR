library(dpcR)


### Name: test_panel
### Title: Dispersion Test for Spatial Point Pattern in Array dPCR Based on
###   Quadrat Counts
### Aliases: test_panel
### Keywords: dPCR pattern quadrat spatial

### ** Examples


many_panels <- sim_adpcr(m = 400, n = 765, times = 1000, pos_sums = FALSE, 
                   n_panels = 5)
test_panel(many_panels)

#test only one plate
test_panel(extract_run(many_panels, 3))

#do test_panel manually
require(spatstat)
ppp_data <- adpcr2ppp(many_panels)
lapply(ppp_data, function(single_panel) quadrat.test(single_panel))





