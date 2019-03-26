library(PharmPow)


### Name: fig_PharmPow_parallel
### Title: Figure for Pharmacometric power calculations for mixed parallel
###   study designs
### Aliases: fig_PharmPow_parallel
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Customised figure for a parallel study design
fig_PharmPow_parallel(data=system.file("extdata","Parallel_results.csv",
                                       package="PharmPow"), 
                      power = 80, 
                      colorabove = "green", colorbelow = "red", 
                      designAlab = "Number of patients with design A", 
                      designBlab = "Number of patients with design B", 
                      zaxeslab = "power (percent)", 
                      axessize = 1.2, labsize = 1.2)



