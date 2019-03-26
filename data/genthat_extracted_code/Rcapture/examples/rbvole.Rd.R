library(Rcapture)


### Name: rbvole
### Title: Robust Design Data for Red-Back Voles
### Aliases: rbvole
### Keywords: datasets

### ** Examples

  # According to Rivest and Daigle (2004), a good robust design model
  # for this data set is formed of an Mth Chao model for each period.
  # This model can be fitted as follows.
  
### data(rbvole)
### memory.limit(size = 2000)
### rd <- robustd.t(rbvole, dfreq = TRUE, vt = rep(3, 6), vm = "Mth", vh = "Chao")

  # WARNING : Because the data has 18 capture occasions, fitting this
  # model uses a lot of memory. Its runtime is several minutes long.



