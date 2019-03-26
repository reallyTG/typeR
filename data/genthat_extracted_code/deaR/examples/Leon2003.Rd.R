library(deaR)


### Name: Leon2003
### Title: Data: Leon, Liern, Ruiz and Sirvent (2003).
### Aliases: Leon2003
### Keywords: datasets

### ** Examples

# Example. Replication of results in Leon et. al (2003, p. 416)
data("Leon2003")
data_example <- read_data_fuzzy(Leon2003,
                                dmus = 1,
                                inputs.mL = 2,
                                inputs.dL=3,
                                outputs.mL = 4,
                                outputs.dL=5)
result <- modelfuzzy_possibilistic(data_example,
                                   h = seq(0,1,by=0.1),
                                   orientation="io",
                                   rts="vrs")
efficiencies(result)




