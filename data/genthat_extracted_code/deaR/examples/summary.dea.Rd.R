library(deaR)


### Name: summary.dea
### Title: Summary conventional DEA models.
### Aliases: summary.dea

### ** Examples

data("PFT1981") 
# Selecting DMUs in Program Follow Through (PFT)
PFT <- PFT1981[1:49, ] 
PFT <- read_data(PFT, 
                 dmus = 1, 
                 inputs = 2:6, 
                 outputs = 7:9 )
eval_pft <- model_basic(PFT, 
                        orientation = "io", 
                        rts = "crs")
summary(eval_pft, exporExcel = FALSE)



