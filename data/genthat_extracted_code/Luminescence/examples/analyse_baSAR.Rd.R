library(Luminescence)


### Name: analyse_baSAR
### Title: Bayesian models (baSAR) applied on luminescence data
### Aliases: analyse_baSAR
### Keywords: datagen

### ** Examples


##(1) load package test data set
data(ExampleData.BINfileData, envir = environment())

##(2) selecting relevant curves, and limit dataset
CWOSL.SAR.Data <- subset(
  CWOSL.SAR.Data,
  subset = POSITION%in%c(1:3) & LTYPE == "OSL")

## Not run: 
##D ##(3) run analysis
##D ##please not that the here selected parameters are
##D ##choosen for performance, not for reliability
##D results <- analyse_baSAR(
##D   object = CWOSL.SAR.Data,
##D   source_doserate = c(0.04, 0.001),
##D   signal.integral = c(1:2),
##D   background.integral = c(80:100),
##D   fit.method = "LIN",
##D   plot = FALSE,
##D   n.MCMC = 200
##D 
##D )
##D 
##D print(results)
##D 
##D 
##D ##XLS_file template
##D ##copy and paste this the code below in the terminal
##D ##you can further use the function write.csv() to export the example
##D 
##D XLS_file <-
##D structure(
##D list(
##D  BIN_FILE = NA_character_,
##D  DISC = NA_real_,
##D  GRAIN = NA_real_),
##D    .Names = c("BIN_FILE", "DISC", "GRAIN"),
##D    class = "data.frame",
##D    row.names = 1L
##D )
##D 
## End(Not run)




