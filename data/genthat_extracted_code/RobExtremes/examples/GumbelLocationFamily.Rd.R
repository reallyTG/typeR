library(RobExtremes)


### Name: GumbelLocationFamily
### Title: Generating function for Gumbel location families
### Aliases: GumbelLocationFamily
### Keywords: models

### ** Examples

##current implementation is:
theta <- 0
names(theta) <- "loc"
GL <- ParamFamily(name = "Gumbel location family",
          param = ParamFamParameter(name = "location parameter", main = theta),
          startPar = function(x,...) c(min(x),max(x)),
          distribution = Gumbel(loc = 0, scale = 1), ## scale known!
          modifyParam = function(theta){ Gumbel(loc = theta, scale = 1) },
          props = paste(c("The Gumbel location family is invariant under",
                    "the group of transformations 'g(x) = x + loc'",
                    "with location parameter 'loc'"), collapse = " "))
GL

(G1 <- GumbelLocationFamily())
plot(G1)
Map(L2deriv(G1)[[1]])
checkL2deriv(G1)



