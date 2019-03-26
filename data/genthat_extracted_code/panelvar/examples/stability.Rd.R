library(panelvar)


### Name: stability
### Title: Stability of PVAR(p) model
### Aliases: stability stability.pvargmm print.pvarstability
###   plot.pvarstability

### ** Examples

data("ex1_dahlberg_data")
stability_info <- stability(ex1_dahlberg_data)
print(stability_info)
plot(stability_info)



