library(caMST)


### Name: multistage_test
### Title: Computer Adaptive Multistage Test
### Aliases: multistage_test

### ** Examples

## No test: 
# using simulated test data
data(example_thetas) # 5 simulated abilities
data(example_responses) # 5 simulated response vectors
# the transition matrix for an 18 item 1-3-3 design
data(example_transition_matrix)
# the MST item bank
data(mst_only_items)
# the MST module matrix
data(example_module_items)
# run the MST model
results <- multistage_test(mst_item_bank = mst_only_items,
modules = example_module_items, transition_matrix = example_transition_matrix,
method = "BM", response_matrix = example_responses, initial_theta = 0,
model = NULL, n_stages = 3, test_length = 18)
## End(No test)
# using number correct scoring for the same data
# create nc_list as explained in 'details'
nc_list = list(module1 = c(4, 5, 7),
module2 = c(8, 14, Inf),
module3 = c(8, 14, 20),
module4 = c(-Inf, 14, 20))
# this is the ONLY difference currently! Everything else remains the same
# run the example
nc.results <- multistage_test(mst_item_bank = mst_only_items,
modules = example_module_items, transition_matrix = example_transition_matrix,
method = "BM", response_matrix = example_responses, initial_theta = 0,
model = NULL, n_stages = 3, test_length = 18, nc_list = nc_list)



