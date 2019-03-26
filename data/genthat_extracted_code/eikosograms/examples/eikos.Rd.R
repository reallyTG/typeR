library(eikosograms)


### Name: eikos
### Title: Generic method for creating an eikosogram
### Aliases: eikos

### ** Examples

eikos("Hair", "Eye", data=HairEyeColor, legend = TRUE)
eikos(gear ~ cyl, data = mtcars)
eikos(Admit ~  Gender + Dept, data = UCBAdmissions,  
      yaxs = FALSE, xaxs = FALSE, 
      lock_aspect = FALSE, 
      xlab_rot = 90, xvals_size = 8,
      ispace = list(bottom = 15))



