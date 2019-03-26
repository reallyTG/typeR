library(remote)


### Name: nXplain
### Title: Number of EOTs needed for variance explanation
### Aliases: nXplain nXplain,EotStack-method

### ** Examples

data(vdendool)

nh_modes <- eot(x = vdendool, y = NULL, n = 3, 
                standardised = FALSE, 
                verbose = TRUE)
             
### How many modes are needed to explain 25% of variance?              
nXplain(nh_modes, 0.25)




