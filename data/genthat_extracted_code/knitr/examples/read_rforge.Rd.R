library(knitr)


### Name: read_rforge
### Title: Read source code from R-Forge
### Aliases: read_rforge

### ** Examples

library(knitr)
## No test: 
# relies on r-forge.r-project.org being accessible
read_rforge("rgl/R/axes.R", project = "rgl")
read_rforge("rgl/R/axes.R", project = "rgl", extra = "&revision=519")
## End(No test)



