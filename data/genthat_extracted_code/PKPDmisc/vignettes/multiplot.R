## ------------------------------------------------------------------------
library(PKPDmisc) # for binning and other functions
library(ggplot2) #plotting
library(purrr) # dataset to handle lists
suppressMessages(suppressWarnings(library(dplyr)))

## ------------------------------------------------------------------------
dat <- sd_oral_richpk %>% filter(ID <= 20)

## ------------------------------------------------------------------------
ggplot(dat, aes(x = Time, y = Conc, group= ID)) + 
  geom_line() +
  facet_wrap(~ID, scales= "free")

## ------------------------------------------------------------------------
# this will automatically create a column of bins such that the
# specified number of individuals is in each bin, in this case
# 9 ids per bin

# split the original dataset into subdatasets corresponding to each bin (list of dataframes)
split_dat <- dat %>% 
  mutate(PLOTS = ids_per_plot(ID, 4)) %>% # default is 9 per subplot
  split(.[["PLOTS"]])

## ------------------------------------------------------------------------
p_conc_time <- function(df) {
ggplot(df, aes(x = Time, y = Conc, group= ID)) + 
  geom_line() +
  facet_wrap(~ID, scales= "free")
}

## ------------------------------------------------------------------------
split_dat %>% map(p_conc_time) 

## ------------------------------------------------------------------------
plot_list <- split_dat %>% map(p_conc_time) 

## ------------------------------------------------------------------------
print_plots(plot_list)

## ------------------------------------------------------------------------
devtools::session_info()

