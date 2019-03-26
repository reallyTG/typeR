library(caMST)


### Name: mixed_adaptive_test
### Title: Mixed Computerized Adaptive Multistage Test
### Aliases: mixed_adaptive_test

### ** Examples

## No test: 
# using simulated test data
data(example_thetas) # 5 simulated abilities
data(example_responses) # 5 simulated response vectors
# the transition matrix for an 18 item 1-3-3 balanced design
data(example_transition_matrix)
# the items designated for use in the routing module with item-level
# adaptation
data(cat_items)
# the items designated for use in the second and third modules with
# module-level adaptation
data(mst_items)
# the matrix specifying how the item data frame relates to the modules
data(example_module_items)

# run the Mca-MST model
results <- mixed_adaptive_test(response_matrix = example_responses[1:2,],
                               cat_item_bank = cat_items, initial_theta = 0,
                               method = "EAP", item_method = "MFI",
                               cat_length = 6, cbControl = NULL, cbGroup = NULL,
                               randomesque = 1, mst_item_bank = mst_items,
                               modules = example_module_items,
                               transition_matrix = example_transition_matrix,
                               n_stages = 3)
## End(No test)




