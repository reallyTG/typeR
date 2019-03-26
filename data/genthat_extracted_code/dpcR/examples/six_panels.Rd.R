library(dpcR)


### Name: six_panels
### Title: Simulated Digital PCR data
### Aliases: six_panels

### ** Examples

#code below was used to create six_panels data set
## Not run: 
##D set.seed(1944)
##D adpcr1 <- sim_adpcr(m = 10, n = 765, times = 10000, pos_sums = FALSE, n_panels = 2)
##D adpcr2 <- sim_adpcr(m = 40, n = 765, times = 10000, pos_sums = FALSE, n_panels = 2)
##D adpcr2 <- rename_dpcr(adpcr2, exper = "Experiment2")
##D adpcr3 <- sim_adpcr(m = 100, n = 765, times = 10000, pos_sums = FALSE, n_panels = 2)
##D adpcr3 <- rename_dpcr(adpcr3, exper = "Experiment3")
##D six_panels_example <- bind_dpcr(adpcr1, adpcr2, adpcr3)
##D six_panels_example <- rename_dpcr(six_panels_example, assay = factor(rep(c("Chr4", "MYC"), 3)))
## End(Not run)



