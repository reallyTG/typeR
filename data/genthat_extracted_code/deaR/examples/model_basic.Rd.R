library(deaR)


### Name: model_basic
### Title: Basic (radial) DEA model.
### Aliases: model_basic

### ** Examples

# Example 1. Basic DEA model with desirable inputs/outputs.
# Replication of results in Charnes, Cooper and Rhodes (1981).
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
eff <- efficiencies(eval_pft)
s <- slacks(eval_pft) 
lamb <- lambdas(eval_pft)
tar <- targets(eval_pft)
ref <- references(eval_pft) 
returns <- rts(eval_pft)

# Example 2. Basic DEA model with undesirable outputs.
# Replication of results in Hua and Bian (2007).
data("Hua_Bian_2007")
# The third output is an undesirable output.
data_example <- read_data(Hua_Bian_2007, 
                          ni = 2,
                          no = 3, 
                          ud_outputs = 3) 
# Translation parameter (vtrans_o) is set to 1500                          
result <- model_basic(data_example, 
                      orientation = "oo", 
                      rts = "vrs", 
                      vtrans_o = 1500) 
eff <- efficiencies(result)
1 / eff # results M5 in Table 6-5 (p.119)

# Example 3. Basic DEA model with non-discretionary (fixed) inputs.
# Replication of results in Ruggiero (2007).
data("Ruggiero2007") 
# The second input is a non-discretionary input.
datadea <- read_data(Ruggiero2007, 
                     ni = 2, no = 1, 
                     nd_inputs = 2) 
result <- model_basic(datadea,
                      orientation = "io", 
                      rts = "crs")
efficiencies(result)
 



