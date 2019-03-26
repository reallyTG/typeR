library(Compind)


### Name: ci_ampi
### Title: Adjusted Mazziotta-Pareto Index (AMPI) method
### Aliases: ci_ampi

### ** Examples

data(EU_2020)

data_test = EU_2020[,c("employ_2010","employ_2011","finalenergy_2010","finalenergy_2011")] 

EU_2020_long<-reshape(data_test, 
                      varying=c("employ_2010","employ_2011","finalenergy_2010","finalenergy_2011"), 
                      direction="long", 
                      idvar="geo", 
                      sep="_")

CI <- ci_ampi(EU_2020_long, 
              indic_col=c(2:3),
              gp=c(50, 100), 
              time=EU_2020_long[,1], 
              polarity= c("POS", "POS"), 
              penalty="POS")
CI$ci_ampi_est




