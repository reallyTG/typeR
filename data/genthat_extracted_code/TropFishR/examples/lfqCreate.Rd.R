library(TropFishR)


### Name: lfqCreate
### Title: Create lfq data from length measurements
### Aliases: lfqCreate
### Keywords: function length-frequency lfq

### ** Examples

# create random data
set.seed(1)
data <- data.frame(length.mm. = sample(c(rpois(300, lambda = 60),
           rpois(200, lambda = 100), rpois(100, lambda = 150)),
           size = 1000, replace = TRUE),
           dates = seq.Date(as.Date("2015-10-02"),as.Date("2016-08-28"),
           length.out = 1000))
# create lfq data
lfq_dat <- lfqCreate(data,Lname = "length.mm.", Dname = "dates", aggregate_dates = TRUE,
   length_unit = "mm", bin_size = 0.5, plot=TRUE, plus_group=c(TRUE,15.75))




