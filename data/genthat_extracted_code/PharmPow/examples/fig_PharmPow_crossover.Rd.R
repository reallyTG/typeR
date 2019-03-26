library(PharmPow)


### Name: fig_PharmPow_crossover
### Title: Figure for Pharmacometric power calculations for mixed crossover
###   study designs
### Aliases: fig_PharmPow_crossover
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Customised figure for a crossover study design
fig_PharmPow_crossover(data=system.file("extdata","Cross_results.csv",
                                        package="PharmPow"), 
                       power = 80, 
                       colorabove = "green", colorbelow = "red", 
                       designAlab = "Number of patients with design A", 
                       designBlab = "Number of patients with design B", 
                       zaxeslab = "power (percent)", 
                       axessize = 1.2, labsize = 1.2)



