library(SamplingStrata)


### Name: plotStrata2d
### Title: Plot bivariate distibutions in strata
### Aliases: plotStrata2d
### Keywords: survey

### ** Examples

## Not run: 
##D library(SamplingStrata)
##D data("swissmunicipalities")
##D swissmunicipalities = swissmunicipalities[swissmunicipalities$REG==1,]
##D data("errors")
##D errors$CV1 <- 0.1
##D errors$CV2 <- 0.1
##D errors <- errors[rep(row.names(errors),7),]
##D errors$domainvalue <- c(1:7)
##D errors
##D swissmunicipalities$id <- c(1:nrow(swissmunicipalities))
##D swissmunicipalities$domain = 1
##D frame <- buildFrameDF(swissmunicipalities,
##D                       id = "id",
##D                       domainvalue = "REG",
##D                       X = c("Surfacesbois","Surfacescult"),
##D                       Y = c("Pop020", "Pop2040")
##D )
##D solution <- optimizeStrata2 (
##D             errors, 
##D             frame,
##D             framecens = NULL, 
##D             strcens = FALSE, 
##D             alldomains = TRUE, 
##D             dom = NULL, 
##D             nStrata = 5, 
##D             minnumstr = 2, 
##D             iter = 50, 
##D             pops = 20, 
##D             mut_chance = NA, 
##D             elitism_rate = 0.2, 
##D             highvalue = 1e+08, 
##D             suggestions = NULL, 
##D             realAllocation = TRUE, 
##D             writeFiles = FALSE, 
##D             showPlot = TRUE, 
##D             parallel = FALSE) 
##D p <- plotStrata2d(solution$framenew, 
##D                   solution$aggr_strata,
##D                   domain = 2, 
##D                   vars = c("X1","X2"),
##D                   labels = c("Surfacesbois","Surfacescult"))
##D p
## End(Not run)



