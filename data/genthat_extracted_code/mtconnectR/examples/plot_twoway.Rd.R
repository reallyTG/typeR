library(mtconnectR)


### Name: plot_twoway
### Title: To plot the mapping between the simulated and actual versions
### Aliases: plot_twoway

### ** Examples

data("example_mtc_device_3")   # MTCDevice object of actual log data
data("example_mtc_device_sim") # Simulated gcode 
data("example_mtc_sim_mapped") # Mapping between simulated and actual data
mapping_ggplot = plot_twoway(example_mtc_sim_mapped, example_mtc_device_sim, 
example_mtc_device_3,offset = 20, total_maps = 100)




