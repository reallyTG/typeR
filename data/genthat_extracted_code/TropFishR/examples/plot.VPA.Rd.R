library(TropFishR)


### Name: plot.VPA
### Title: VPA plot
### Aliases: plot.VPA

### ** Examples

data(whiting)
output <- VPA(whiting, terminalF = 0.5)
plot(output, display_last_class = FALSE)

data(hake)
output <- VPA(hake, terminalE = 0.5, catch_unit = "'000")
plot_mat <- output$plot_mat[,-c(1,2)]  # remove first two length classes
class(plot_mat) <- "VPA"
plot(plot_mat, xlabel = "Midlengths [cm]")




