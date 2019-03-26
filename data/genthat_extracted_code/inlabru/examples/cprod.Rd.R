library(inlabru)


### Name: cprod
### Title: Cross product of integration points
### Aliases: cprod

### ** Examples

## No test: 
# ipoints needs INLA
if (require("INLA", quietly = TRUE)) {
# Create integration points in dimension 'myDim' and 'myDiscreteDim' 
ips1 = ipoints(c(0,8), name = "myDim")
ips2 = ipoints(as.integer(c(1,2,3)), name = "myDiscreteDim")

# Calculate the cross product
ips = cprod(ips1, ips2)

# Plot the integration points
plot(ips$myDim, ips$myDiscreteDim, cex = 10*ips$weight)
}
## End(No test)



