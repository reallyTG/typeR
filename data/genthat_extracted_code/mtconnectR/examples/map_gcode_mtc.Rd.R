library(mtconnectR)


### Name: map_gcode_mtc
### Title: Create a mapping between simulated and actual data
### Aliases: map_gcode_mtc

### ** Examples

data("example_gcode_parsed") # Parsed gcode
data("example_mtc_device_3") # MTCDevice object of actual log data
simulated_gcode_data = na.omit(simulate_data_from_gcode(example_gcode_parsed, 
start_time = 0, data_res = 0.1, data_type = "HH"))
mtc_device_sim = create_mtc_device_from_ts(simulated_gcode_data)
mtc_sim_mapped = map_gcode_mtc(mtc_device_sim, example_mtc_device_3, elasticity = 200)



