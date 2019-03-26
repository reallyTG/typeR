library('testthat')

#===============================================================================
context("map_gcode_mtc")
data("example_mtc_device_3")
data("example_mtc_device_sim")
data("example_mtc_sim_mapped")
mtc_sim_mapped = map_gcode_mtc(example_mtc_device_sim, example_mtc_device_3, elasticity = 200)
expect_equal(mtc_sim_mapped,example_mtc_sim_mapped)

# #===============================================================================
# context("plot_twoway")
# data("example_mapped_plot")
# mapped_plot = plot_twoway(example_mtc_sim_mapped, example_mtc_device_sim, example_mtc_device_3,
#                           offset = 20, total_maps = 100)
# 
# expect_equal(mapped_plot, example_mapped_plot)

