library(inlabru)


### Name: int
### Title: Weighted summation (integration) of data frame subsets
### Aliases: int

### ** Examples

## No test: 
# ipoints needs INLA
if (require("INLA", quietly = TRUE)) {
# Create integration points in two dimensions, x and y

ips = cprod(ipoints(c(0,10), 10, name = "x"),
            ipoints(c(1,5), 10, name = "y"))

# The sizes of the domains are 10 and 4 for x and y, respectively.
# Integrating f(x,y) = 1 along x and y should result in the total
# domain size 40

int(ips, rep(1, nrow(ips)), c("x","y"))
}
## End(No test)



