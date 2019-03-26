library(iFad)


### Name: mcmc_trace_plot
### Title: Traceplot of the Gibbs sampling iterations
### Aliases: mcmc_trace_plot

### ** Examples


library(Rlab)
library(MASS)
library(coda)
library(ROCR)

data(tau_g_chain)
mcmc_trace_plot(tau_g_chain,plot_file_name="Demo_traceplot.pdf", index=1:10)




