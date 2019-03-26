library(PowerTOST)


### Name: CV2se+se2CV+CV2mse+mse2CV
### Title: Helper functions
### Aliases: CV2se se2CV CV2mse mse2CV

### ** Examples

# these functions are one liners:
CV2se <- function(CV) return(sqrt(log(1.0 + CV^2)))
se2CV <- function(se) return(sqrt(exp(se*se)-1))

CV2se(0.3)
# should give: [1] 0.2935604 

se2CV(0.2935604)
#[1] 0.3 



