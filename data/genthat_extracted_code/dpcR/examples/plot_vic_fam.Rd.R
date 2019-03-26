library(dpcR)


### Name: plot_vic_fam
### Title: Amplitude Plot VIC and FAM Channels of a Droplet Digital PCR
###   Experiment
### Aliases: plot_vic_fam
### Keywords: hplot

### ** Examples


# Generate an amplitude plot for the first fluorescence channel (e.g., FAM)
fluos1 <- sim_dpcr(m = 16, n = 30, times = 100, pos_sums = FALSE, n_exp = 1, 
  fluo = list(0.1, 0))

# Generate an amplitude plot for the second fluorescence channel (e.g., VIC)
fluos2 <- sim_dpcr(m = 16, n = 30, times = 100, pos_sums = FALSE, n_exp = 1, 
  fluo = list(0.1, 0))

# Plot the amplitudes of both fluorescence channel in an aligned fashion
plot_vic_fam(fam = fluos1, vic = fluos2)

# Same as above but different colors
plot_vic_fam(fam = fluos1, vic = fluos2, col_vic = "red", col_fam = "yellow")

# Same as above without circles
plot_vic_fam(fam = fluos1, vic = fluos2, col_vic = "red", col_fam = "yellow", circle = FALSE)

# Generate two channels in one object and plot them
fluos_both <- sim_dpcr(m = 16, n = 30, times = 100, pos_sums = FALSE, n_exp = 2, 
  fluo = list(0.1, 0))
plot_vic_fam(extract_run(fluos_both, 1), extract_run(fluos_both, 2))




