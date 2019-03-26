library(vdg)


### Name: plot.spv
### Title: Plot VDGs or FDS plots
### Aliases: plot.spv plot.spvforlist plot.spvlist plot.spvlistforlist
### Keywords: hplot

### ** Examples


# Single design (class 'spv')
# Larger n should be used in actual cases
library(rsm)
bbd3 <- as.data.frame(bbd(3)[,3:5])
colnames(bbd3) <- paste0("x", 1:3)
quad.3f <- formula(~ x1*x2*x3 - x1:x2:x3 + I(x1^2) + I(x2^2) + I(x3^2))
set.seed(1234)
out <- spv(n = 1000, design = bbd3, type = "spherical", formula = quad.3f)
out
plot(out)

# List of designs (class 'spvlist')
## Not run: 
##D library(Vdgraph)
##D data(SCDH5); data(SCDDL5)
##D des.list <- list(SCDH5 = SCDH5, SCDDL5 = SCDDL5)
##D quad.5f <- formula(~ x1 + x2 + x3 + x4 + x5 + x1:x2 + x1:x3 + x1:x4 + x1:x5
##D                     + x2:x3 + x2:x4 + x2:x5 + x3:x4 + x3:x5 + x4:x5 
##D                    + I(x1^2) + I(x2^2) + I(x3^2) + I(x4^2) + I(x5^2))
##D out2 <- spv(n = 500, design = des.list, type = "spherical", formula = quad.5f)
##D out2
##D plot(out2)
## End(Not run)

# List of formulae (class 'spvforlist')
## Not run: 
##D fact3 <- expand.grid(x1 = c(-1,1), x2 = c(-1, 1), x3 = c(-1,1))
##D lin.3f <- formula(~ x1 + x2 + x3)
##D int.3f <- formula(~ (x1+x2+x3)^2)
##D set.seed(4312)
##D out3 <- spv(n = 500, design = fact3, type = "cuboidal", 
##D              formula = list(linear = lin.3f, interaction = int.3f))
##D out3
##D plot(out3)
## End(Not run)

# List of formulae and designs (class 'spvlistforlist')
## Not run: 
##D fact3.n <- rbind(fact3, 0, 0, 0)
##D set.seed(4312)
##D out4 <- spv(n = 200, design = list(factorial = fact3, factorial.with.cntr = fact3.n), 
##D              type = "cuboidal", formula = list(linear = lin.3f, interaction = int.3f))
##D out4
##D plot(out4)
## End(Not run)



