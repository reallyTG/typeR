library(deaR)


### Name: bootstrap_basic
### Title: Bootstrapping DEA
### Aliases: bootstrap_basic

### ** Examples

# To replicate the results in Simar y Wilson (1998, p. 58) you have to
# set B=2000 (in the example B=100 to save time)
data("Electric_plants")
data_example <- read_data(Electric_plants, 
                          ni = 3, 
                          no = 1)
result <- bootstrap_basic(datadea = data_example,
                             orientation="io",
                             rts="vrs",
                             B=100)
result$score_bc
result$CI




