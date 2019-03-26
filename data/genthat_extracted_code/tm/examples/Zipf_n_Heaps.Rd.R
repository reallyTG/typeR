library(tm)


### Name: Zipf_n_Heaps
### Title: Explore Corpus Term Frequency Characteristics
### Aliases: Zipf_plot Heaps_plot

### ** Examples

data("acq")
m <- DocumentTermMatrix(acq)
Zipf_plot(m)
Heaps_plot(m)



