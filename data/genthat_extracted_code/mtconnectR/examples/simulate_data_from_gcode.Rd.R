library(mtconnectR)


### Name: simulate_data_from_gcode
### Title: Simulate position,velocity and other data from G-code
### Aliases: simulate_data_from_gcode

### ** Examples

data("example_gcode_parsed")
simulated_data_from_gcode <- simulate_data_from_gcode(example_gcode_parsed,start_time = 0, 
data_res = 0.2, data_type = "HH")



