library(deaR)


### Name: Hua_Bian_2007
### Title: Data: Hua and Bian (2007).
### Aliases: Hua_Bian_2007
### Keywords: datasets

### ** Examples

# Example. Replication of results in Hua and Bian (2007).
data("Hua_Bian_2007")
# The third output is an undesirable output
data_example <- read_data(Hua_Bian_2007,
                          ni=2,
                          no=3,
                          ud_outputs=3)

# Translation parameter (vtrans_o) is set to 1500
result <- model_basic(data_example,
                      orientation="oo",
                      rts="vrs",
                      vtrans_o=1500)
eff <- efficiencies(result)
1/eff # results M5 in Table 6-5 (p.119)




