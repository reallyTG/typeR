library(deaR)


### Name: model_sbmsupereff
### Title: Slack based measure of superefficiency model
### Aliases: model_sbmsupereff

### ** Examples

# Replication of results in Tone(2002, p.39)
data("Power_plants")
data_example <- read_data(Power_plants, ni = 4, no = 2)
result <- model_sbmsupereff(data_example, orientation = "io", rts = "crs") 
efficiencies(result)
slacks(result)$slack_input
references(result)




