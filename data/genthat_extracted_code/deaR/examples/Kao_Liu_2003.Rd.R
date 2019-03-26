library(deaR)


### Name: Kao_Liu_2003
### Title: Data: Kao and Liu (2003).
### Aliases: Kao_Liu_2003
### Keywords: datasets

### ** Examples

# Example. Replication of results in Kao and Liu (2003, p.152)
data_example <- read_data_fuzzy(Kao_Liu_2003,
                                dmus=1,
                                inputs.mL= 2,
                                outputs.mL= 3:7,
                                outputs.dL=c(NA,NA,8,NA,10),
                                outputs.dR=c(NA,NA,9,NA,11))
result <- modelfuzzy_kaoliu(data_example,
                            kaoliu_modelname = "basic",
                            orientation="oo",
                            rts="vrs",
                            alpha=0)
eff <- efficiencies(result)
eff




