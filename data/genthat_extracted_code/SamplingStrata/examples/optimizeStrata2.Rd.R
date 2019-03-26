library(SamplingStrata)


### Name: optimizeStrata2
### Title: Best stratification of a sampling frame for multipurpose surveys
###   (only with continuous stratification variables)
### Aliases: optimizeStrata2
### Keywords: survey

### ** Examples

## Not run: 
##D data("swissmunicipalities")
##D swissmunicipalities$id <- c(1:nrow(swissmunicipalities))
##D swissmunicipalities$dom <- 1
##D frame <- buildFrameDF(swissmunicipalities,
##D                       id = "id",
##D                       domainvalue = "REG",
##D                       X = c("Surfacesbois","Surfacescult"),
##D                       Y = c("Pop020", "Pop2040")
##D )
##D # choice of units to be selected in any case (census units)
##D framecens <- frame[frame$X1 > 2500 
##D                    | frame$X2 > 1500,]
##D # remaining units 
##D framesamp <- frame[!(frame$id ##D 
##D # precision constraints
##D errors <- NULL
##D errors$DOM <- "DOM1"
##D errors$CV1 <- 0.1
##D errors$CV2 <- 0.1
##D errors <- as.data.frame(errors)
##D errors <- errors[rep(row.names(errors),7),]
##D errors$domainvalue <- c(1:7)
##D errors
##D 
##D solution <- optimizeStrata2 (
##D   errors, 
##D   framesamp,
##D   framecens = framecens, 
##D   strcens = TRUE, 
##D   alldomains = FALSE,
##D   dom = 4,
##D   iter = 50,
##D   pops = 20,
##D   nStrata = 5,
##D   writeFiles = FALSE,
##D   showPlot = FALSE,
##D   parallel = TRUE
##D )
##D sum(round(solution$aggr_strata$SOLUZ))
##D expected_CV(solution$aggr_strata)
##D outstrata <- plotStrata2d(
##D                   solution$framenew, 
##D                   solution$aggr_strata,
##D                   domain = 4, 
##D                   vars = c("X1","X2"),
##D                   labels =     c("Surfacesbois","Surfacescult")
##D                   )
##D outstrata
## End(Not run)



