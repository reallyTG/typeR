library(SimDesign)


### Name: SimShiny
### Title: Generate a basic Monte Carlo simulation GUI template
### Aliases: SimShiny

### ** Examples

## Not run: 
##D 
##D Design <- expand.grid(sample_size = c(30, 60, 90, 120),
##D                       group_size_ratio = c(1, 4, 8),
##D                       standard_deviation_ratio = c(.5, 1, 2))
##D 
##D Generate <- function(condition, fixed_objects = NULL){
##D     N <- condition$sample_size
##D     grs <- condition$group_size_ratio
##D     sd <- condition$standard_deviation_ratio
##D     if(grs < 1){
##D         N2 <- N / (1/grs + 1)
##D         N1 <- N - N2
##D     } else {
##D         N1 <- N / (grs + 1)
##D         N2 <- N - N1
##D     }
##D     group1 <- rnorm(N1)
##D     group2 <- rnorm(N2, sd=sd)
##D     dat <- data.frame(group = c(rep('g1', N1), rep('g2', N2)), DV = c(group1, group2))
##D     dat
##D }
##D 
##D Analyse <- function(condition, dat, fixed_objects = NULL){
##D     welch <- t.test(DV ~ group, dat)
##D     ind <- t.test(DV ~ group, dat, var.equal=TRUE)
##D 
##D     # In this function the p values for the t-tests are returned,
##D     #  and make sure to name each element, for future reference
##D     ret <- c(welch = welch$p.value, independent = ind$p.value)
##D     ret
##D }
##D 
##D Summarise <- function(condition, results, fixed_objects = NULL){
##D     #find results of interest here (e.g., alpha < .1, .05, .01)
##D     ret <- EDR(results, alpha = .05)
##D     ret
##D }
##D 
##D # test that it works
##D # Final <- runSimulation(design=Design, replications=5,
##D #                       generate=Generate, analyse=Analyse, summarise=Summarise)
##D 
##D # print code to console
##D SimShiny(design=Design, generate=Generate, analyse=Analyse,
##D          summarise=Summarise, verbose=FALSE)
##D 
##D # save shiny code to file
##D SimShiny('app.R', design=Design, generate=Generate, analyse=Analyse,
##D          summarise=Summarise, verbose=FALSE)
##D 
##D # run the application
##D shiny::runApp()
##D shiny::runApp(launch.browser = TRUE) # in web-browser
##D 
## End(Not run)



