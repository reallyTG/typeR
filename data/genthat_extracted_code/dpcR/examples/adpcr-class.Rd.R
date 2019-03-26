library(dpcR)


### Name: adpcr-class
### Title: Class '"adpcr"' - end-point array digital PCR experiments
### Aliases: adpcr-class adpcr
### Keywords: classes

### ** Examples


rand_array <- sim_adpcr(400, 1600, 100, pos_sums = FALSE, n_panels = 5)
one_rand_array <- extract_run(rand_array, 1)
plot_panel(one_rand_array, 40, 40)




