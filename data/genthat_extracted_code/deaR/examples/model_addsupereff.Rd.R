library(deaR)


### Name: model_addsupereff
### Title: Additive super-efficiency DEA model.
### Aliases: model_addsupereff

### ** Examples

# Replication of results in Du, Liang and Zhu (2010, Table 6, p.696)
data("Power_plants")
Power_plants <- read_data(Power_plants, 
                          ni = 4, 
                          no = 2)
result <- model_addsupereff(Power_plants, 
                            rts = "crs")  
efficiencies(result)




