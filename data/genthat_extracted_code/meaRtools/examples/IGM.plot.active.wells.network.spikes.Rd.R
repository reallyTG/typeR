library(meaRtools)


### Name: plot_active_wells_network_spikes
### Title: plot_active_wells_network_spikes
### Aliases: plot_active_wells_network_spikes
### Keywords: network spikes

### ** Examples

data("S") 
data('parameters')
nspikes <- calculate_network_spikes( S, parameters$sur ,parameters$ns_n, parameters$ns_t )
## No test: 
  pdf(file=NSPlotPath)
  xyplot.network.spikes(nspikes)	
  plot_active_wells_network_spikes(nspikes)
  dev.off()
## End(No test)




