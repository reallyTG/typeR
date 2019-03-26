library(meaRtools)


### Name: calculate_entropy_and_mi
### Title: Calculate Entropy and mututal information for each treatment
###   level
### Aliases: calculate_entropy_and_mi
### Keywords: Mutual Information Entropy

### ** Examples

library(meaRtools)

data(S)
S <- filter_nonactive_spikes(S,spikes_per_minute_min=1)

treatments <- c("treatX", "treatY")
## compute entropies and MI's  
ENT.MI <- calculate_entropy_and_mi(S, treatments, mult_factor=1.5, bin_size=0.1)
data_dists <- ENT.MI[["data_dists"]]
norm_mis_per_well <- ENT.MI[["norm_mis_per_well"]]

# test for difference in mean entropy between treatmentA, treatmentB
ent <- data_dists[["ENT"]]
ent.WT <- mean(ent[[treatments[1]]])
ent.MUT <- mean(ent[[treatments[2]]])
ent.res <- wilcox.test(ent[[treatments[1]]], ent[[treatments[2]]])
cat("entropy means (WT / MUT) :", ent.WT, "/", ent.MUT, "\n")
print(ent.res)

# test for diff in mutual info btwn treatmentA, treatmentB
mi <- data_dists[["MI"]]
mi.WT <- mean(mi[[treatments[1]]])
mi.MUT <- mean(mi[[treatments[2]]])
mi.res <- wilcox.test(mi[[treatments[1]]], mi[[treatments[2]]])
cat("mutual info means (WT / MUT) :", mi.WT, "/", mi.MUT, "\n") 
print(mi.res)
## No test: 
  plot(density(mi[[treatments[1]]]))
  lines(density(mi[[treatments[2]]]), col="red")
## End(No test)




