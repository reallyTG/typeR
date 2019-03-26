library(curvHDR)


### Name: curvHDRfilter
### Title: Filtering via the curvHDR method.
### Aliases: curvHDRfilter
### Keywords: flow cytomery feature significance density estimation

### ** Examples

library(curvHDR)

# Univariate curvHDR examples:

xUniv <- c(rnorm(1000,-2),rnorm(1000,2))

gate1a <- curvHDRfilter(xUniv)
plot(gate1a)
print(gate1a$poly) # List of intervals that define gate1a.
## Not run: 
##D print(gate1a$insideFilter)  # Indicators of inclusion of
##D                                      # xUniv inside gate1a.
## End(Not run)

gate1b <- curvHDRfilter(xUniv,HDRlevel=0.5)
plot(gate1b)
print(gate1b$poly) # List of intervals that define gate1b. 
## Not run: 
##D print(gate1b$insideFilter) # Indicators of inclusion of
##D                                      # xUniv inside gate1b.
## End(Not run)

# Bivariate curvHDR examples:

xBiva <- cbind(c(rnorm(1000,-2),rnorm(1000,2)),
               c(rnorm(1000,-2),rnorm(1000,2)))

## Not run: 
##D gate2a <- curvHDRfilter(xBiva)
##D plot(gate2a)
##D print(gate2a$poly) # List of polygon vertices that define gate2a.
##D print(gate2a$insideFilter) # Indicators of inclusion of
##D                              # xBiva inside gate2a.
## End(Not run)

## Not run: 
##D gate2b <- curvHDRfilter(xBiva,HDRlevel=0.5)
##D plot(gate2b)
##D print(gate2b$poly)           # List of polygon vertices that define gate2b.
##D print(gate2b$insideFilter)   # Indicators of inclusion of
##D                              # xBiva inside gate2b.
## End(Not run)

# Trivariate curvHDR examples:

## Not run: 
##D xTriv <- cbind(c(rnorm(1000,-2),rnorm(1000,2)),
##D                c(rnorm(1000,-2),rnorm(1000,2)),
##D                c(rnorm(1000,-2),rnorm(1000,2)))
##D 
##D gate3a <- curvHDRfilter(xTriv)
##D plot(gate3a)
##D print(gate3a$poly)         # List of polyhedron elements that define gate3a.
##D print(gate3a$insideFilter) # Indicators of inclusion of
##D                            # xTriv inside gate3a.
## End(Not run)

## Not run: 
##D gate3b <- curvHDRfilter(xTriv,HDRlevel=0.5)
##D plot(gate3b)
##D print(gate3b$poly)          # List of polyhedron elements that define gate3b.
##D print(gate3b$insideFilter)  # Indicators of inclusion of
##D                             # xTriv inside gate3b.
## End(Not run)



