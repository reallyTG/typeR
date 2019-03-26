library(deaR)


### Name: model_sbmeff
### Title: Slack based measure (SBM) of efficiency model.
### Aliases: model_sbmeff

### ** Examples

# Replication of results in Tone (2001, p.505)
data("Tone2001")
data_example <- read_data(Tone2001, 
                          ni = 2, 
                          no = 2)
result_SBM <- model_sbmeff(data_example, 
                           orientation = "no", 
                           rts = "crs")
result_CCR <- model_basic(data_example, 
                          orientation = "io", 
                          rts = "crs")
efficiencies(result_SBM)
efficiencies(result_CCR)
slacks(result_SBM)
slacks(result_CCR)
 



