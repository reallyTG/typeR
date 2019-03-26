library(RMAWGEN)


### Name: ComprehensivePrecipitationGenerator
### Title: The comprehensive Precipitation Generator
### Aliases: ComprehensivePrecipitationGenerator

### ** Examples


data(trentino)
set.seed(1222) # set the seed for random generations!
year_max <- 1990
year_min <- 1961
year_max_sim <- 1982
year_min_sim <- 1981

n_GPCA_iter <- 2
p <- 1
nscenario=1
station <- c("T0090","T0083")  
## Not Run: the call to ComprehensivePrecipitationGenerator may elapse too 
## long time (more than 5 eseconds) and is not executed  by CRAN check.  
## Please uncomment the following line to run the example on your own PC. 
# generation00 <- ComprehensivePrecipitationGenerator(station=station,
# prec_all=PRECIPITATION,year_min=year_min,year_max=year_max,
# year_min_sim=year_min_sim,year_max_sim=year_max_sim,p=p,
# n_GPCA_iteration=n_GPCA_iter,n_GPCA_iteration_residuals=0,
# sample="monthly",nscenario=nscenario,no_spline=TRUE)

#




