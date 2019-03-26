library(meaRtools)


### Name: calc_burst_distributions
### Title: calculate and plot burst featues distributions
### Aliases: calc_burst_distributions
### Keywords: distributions IBI frequency burst

### ** Examples

# Load exapmple of recording Robject (MEA data structure)
data("S")  
feature="ibi"; 
## No test: 
   calc_burst_distributions(S, min_vals = 15, xlimit = 20, bins_in_sec = 5, 
           feature = feature, per_well = 0, outputdir = "/Analysis")
## End(No test)



