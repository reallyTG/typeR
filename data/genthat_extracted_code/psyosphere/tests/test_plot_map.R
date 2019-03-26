
cat("\nTesting plot_map()\n")

# Test's fail when executed with devtools ...

# test getting simple map ------------------------------------------------------

# data(psyo_rounds)
#
# map <- psyosphere::plot_map(psyo_rounds)
# map
#
# # Check results
# if (!ggplot2::is.ggplot(map)) {
#   stop("plot is not a ggplot variable")
# }

# test zoom level --------------------------------------------------------------

# finish <- data.frame(lon = c(6.851810,6.851000), lat = c(52.241800,52.240300))
# plot <- psyosphere::plot_line(finish)
# plot
#
# plot$zoom
#
# # Check result
# if (plot$zoom != 18) {
#   stop("Wrong zoom level.")
# }

