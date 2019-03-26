library(growthcurver)


### Name: SummarizeGrowth
### Title: Summarize Growth Curves
### Aliases: SummarizeGrowth

### ** Examples

# We can check that the parameters that are found are the same
# as we use to generate fake experimental data. To do so, let's first
# generate the "experimental" data using the logistic equation,
# e.g., absorbance readings from a single well in a plate reader over time.

k_in <- 0.5   # the initial carrying capacity
n0_in <- 1e-5 # the initial absorbance reading
r_in <- 1.2   # the initial growth rate
N <- 50       # the number of "measurements" collected during the growth
              # curve experiment

data_t <- 0:N * 24 / N   # the times the measurements were made (in hours)
data_n <- NAtT(k = k_in, n0 = n0_in, r = r_in, t = data_t) # the measurements

# Now summarize the "experimental" growth data that we just generated
gc <- SummarizeGrowth(data_t, data_n)

# Get the possible metrics for fitness proxies
gc$vals$r           # growth rate is a common choice for fitness
gc$vals$t_gen       # doubling time, or generation time, is also common
gc$vals$k
gc$vals$n0
gc$vals$auc_l
gc$vals$auc_e
gc$vals$t_mid

# Compare the data with the fit visually by plotting it
plot(gc)




