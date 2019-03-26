library('testthat')

context("simulate_data_from_gcode")
data("example_gcode_parsed")
data("example_simulated_gcode_data")
simulated_gcode_data = na.omit(simulate_data_from_gcode(example_gcode_parsed, start_time = 0, data_res = 0.1, data_type = "HH"))
expect_equal(simulated_gcode_data,example_simulated_gcode_data)
