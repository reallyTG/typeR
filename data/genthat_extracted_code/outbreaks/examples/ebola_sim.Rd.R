library(outbreaks)


### Name: ebola_sim
### Title: Simulated Ebola outbreak
### Aliases: ebola_sim ebola_sim_clean
### Keywords: datasets

### ** Examples

## identify mistakes in data entry (negative incubation period)
mistakes <- which(ebola_sim$linelist$date_of_onset <= ebola_sim$linelist$date_of_infection)
mistakes
ebola_sim$linelist[mistakes, ]

## check that ebola_sim_clean is identical after removing mistakes
identical(ebola_sim_clean$linelist, ebola_sim$linelist[-mistakes, ])




