library(dpcR)


### Name: extract_run
### Title: Extract Digital PCR Run
### Aliases: extract_run
### Keywords: extract manip panel

### ** Examples


#sample extracting
panels <- sim_adpcr(10, 40, 1000, pos_sums = FALSE, n_panels = 50)
single_panel <- extract_run(panels, 5)
random_three <- extract_run(panels, sample.int(ncol(panels), 3))
all_but_one <- extract_run(panels, -5)

#the same for fluorescence data
fluos <- sim_dpcr(10, 40, 1000, pos_sums = FALSE, n_exp = 50, 
                   fluo = list(0.1, 0))
single_fluo <- extract_run(fluos, 5)





