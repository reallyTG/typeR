library(DesignLibrary)


### Name: binary_iv_designer
### Title: Create a binary instrumental variables design
### Aliases: binary_iv_designer simple_iv_designer

### ** Examples

# Generate a simple iv design: iv identifies late not ate 
binary_iv_design_1 <- binary_iv_designer(N = 1000, b = c(.1, .2, .3, .4))
## Not run: 
##D diagnose_design(binary_iv_design_1)
## End(Not run)

# Generates a simple iv design with violation of monotonicity
binary_iv_design_2 <- binary_iv_designer(type_probs = c(.1,.1,.6, .2), b_Y = .5)
## Not run: 
##D diagnose_design(binary_iv_design_2)
## End(Not run)

# Generates a simple iv design with violation of exclusion restriction
binary_iv_design_3 <- binary_iv_designer(d_Y = .5, b_Y = .5)
## Not run: 
##D diagnose_design(binary_iv_design_3)
## End(Not run)

# Generates a simple iv design with violation of randomization
binary_iv_design_4 <- binary_iv_designer(N = 1000, assignment_probs = c(.2, .3, .7, .5), b_Y = .5)
## Not run: 
##D diagnose_design(binary_iv_design_4)
## End(Not run)

# Generates a simple iv design with violation of first stage
binary_iv_design_5 <- binary_iv_designer(type_probs = c(.5,.5, 0, 0), b_Y = .5)
## Not run: 
##D diagnose_design(binary_iv_design_5)
## End(Not run)




