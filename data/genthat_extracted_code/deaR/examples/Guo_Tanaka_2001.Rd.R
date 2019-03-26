library(deaR)


### Name: Guo_Tanaka_2001
### Title: Data: Guo and Tanaka (2001).
### Aliases: Guo_Tanaka_2001
### Keywords: datasets

### ** Examples

data("Guo_Tanaka_2001")
data_example <- read_data_fuzzy(Guo_Tanaka_2001,
                                dmus=1,
                                inputs.mL=2:3,
                                inputs.dL=4:5,
                                outputs.mL=6:7,
                                outputs.dL=8:9)
result <- modelfuzzy_guotanaka(data_example,
                               h = seq(0,1,by=0.1),
                               orientation="io")
efficiencies(result)




