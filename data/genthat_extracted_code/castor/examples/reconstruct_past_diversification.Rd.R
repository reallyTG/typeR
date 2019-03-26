library(castor)


### Name: reconstruct_past_diversification
### Title: Reconstruct past diversification dynamics from a diversity time
###   series.
### Aliases: reconstruct_past_diversification
### Keywords: tree model fitting

### ** Examples

#####################################################
# EXAMPLE 1

# Generate a coalescent tree
params = list(birth_rate_intercept  = 0, 
              birth_rate_factor     = 1,
              birth_rate_exponent   = 1,
              death_rate_intercept  = 0,
              death_rate_factor     = 0.05,
              death_rate_exponent   = 1.3,
              rarefaction           = 1)
simulation = generate_random_tree(params,max_time_eq=1,coalescent=TRUE)
tree = simulation$tree
time_span = simulation$final_time - simulation$root_time
cat(sprintf("Generated tree has %d tips, spans %g time units\n",length(tree$tip.label),time_span))

# Calculate diversity time series from the tree
counter = count_clades_over_time(tree, times=seq(0,0.99*time_span,length.out=100))

# print coalescent diversities
print(counter$diversities)

# reconstruct diversification dynamics based on diversity time series
results = reconstruct_past_diversification( counter$times,
                                            counter$diversities,
                                            coalescent      = TRUE,
                                            smoothing_span  = 3,
                                            smoothing_order = 1)
                                            
# print reconstructed total diversities
print(results$total_diversities)
                                                  
# plot coalescent and reconstructed true diversities
matplot(x     = counter$times, 
        y     = matrix(c(counter$diversities,results$total_diversities), ncol=2, byrow=FALSE),
        type  = "b", 
        xlab  = "time", 
        ylab  = "# clades",
        lty   = c(1,2), pch = c(1,0), col = c("red","blue"))
legend( "topleft", 
        legend  = c("coalescent (simulated)","true (reconstructed)"), 
        col     = c("red","blue"), lty = c(1,2), pch = c(1,0));
        
        
        
#####################################################
# EXAMPLE 2

# Generate a non-coalescent tree
params = list(birth_rate_intercept  = 0, 
              birth_rate_factor     = 1,
              birth_rate_exponent   = 1,
              death_rate_intercept  = 0,
              death_rate_factor     = 0.05,
              death_rate_exponent   = 1.3,
              rarefaction           = 1)
simulation = generate_random_tree(params,max_time_eq=1,coalescent=FALSE)
tree = simulation$tree
time_span = simulation$final_time - simulation$root_time
cat(sprintf("Generated tree has %d tips, spans %g time units\n",length(tree$tip.label),time_span))

# Calculate diversity time series from the tree
counter = count_clades_over_time(tree, times=seq(0,0.99*time_span,length.out=100))

# print true diversities
print(counter$diversities)

# reconstruct diversification dynamics based on diversity time series
results = reconstruct_past_diversification( counter$times,
                                            counter$diversities,
                                            birth_rates_pc  = params$birth_rate_factor,
                                            coalescent      = FALSE,
                                            smoothing_span  = 3,
                                            smoothing_order = 1)
                                            
# print coalescent diversities
print(results$coalescent_diversities)
                                                  
# plot coalescent and reconstructed true diversities
matplot(x     = counter$times, 
        y     = matrix(c(results$coalescent_diversities,counter$diversities), ncol=2, byrow=FALSE),
        type  = "b", 
        xlab  = "time", 
        ylab  = "# clades",
        lty   = c(1,2), pch = c(1,0), col = c("red","blue"))
legend( "topleft", 
        legend  = c("coalescent (reconstructed)","true (simulated)"), 
        col     = c("red","blue"), lty = c(1,2), pch = c(1,0));



