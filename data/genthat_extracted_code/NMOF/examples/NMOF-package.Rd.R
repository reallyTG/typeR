library(NMOF)


### Name: NMOF-package
### Title: Numerical Methods and Optimization in Finance
### Aliases: NMOF-package NMOF
### Keywords: package

### ** Examples

## Not run: 
##D library("NMOF")
##D 
##D ## overview
##D packageDescription("NMOF")
##D help(package = "NMOF")
##D 
##D ## code from the book
##D showExample("equations.R")
##D showExample("exampleLS.R", chapter = 13)
##D 
##D ## show NEWS file
##D news(Version >= "0.40-0", package = "NMOF")
##D 
##D ## vignettes
##D vignette(package = "NMOF")
##D nss <- vignette("DEnss", package = "NMOF")
##D print(nss)
##D edit(nss)
##D 
##D ## book website
##D browseURL("http://nmof.net")
##D browseURL("http://enricoschumann.net/NMOF/")
##D 
##D ## more examples
##D file.show(system.file("NMOFex/README",   package = "NMOF"))
##D file.show(system.file("NMOFex/NMOFman.R", package = "NMOF"))
##D 
##D ## unit tests
##D file.show(system.file("unitTests/test_results.txt",   package = "NMOF"))
## End(Not run)
test.rep <- readLines(system.file("unitTests/test_results.txt",   package = "NMOF"))
nt <- gsub(".*\\(([0-9]+) checks?\\).*", "\\1",
           test.rep[grep("\\(\\d+ checks?\\)", test.rep)])
message("Number of unit tests: ", sum(as.numeric(nt)))




