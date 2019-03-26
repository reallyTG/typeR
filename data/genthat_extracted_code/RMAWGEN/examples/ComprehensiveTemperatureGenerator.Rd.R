library(RMAWGEN)


### Name: ComprehensiveTemperatureGenerator
### Title: The Comprehensive Temperature Generator
### Aliases: ComprehensiveTemperatureGenerator

### ** Examples


data(trentino)

set.seed(1222) # set the seed for random generations!
year_min <- 1961
year_max <- 1990

year_min_sim <- 1982
year_max_sim <- 1983

n_GPCA_iter <- 5 
n_GPCA_iteration_residuals <- 5
p <- 1
vstation <- c("B2440","B6130","B8570","B9100","LAVIO","POLSA","SMICH","T0001",
 "T0010","T0014","T0018","T0032","T0064","T0083","T0090","T0092",
"T0094","T0099","T0102","T0110","T0129","T0139","T0147","T0149",
"T0152","T0157","T0168","T0179","T0189","T0193","T0204","T0210",
"T0211","T0327","T0367","T0373")		
## Not Run: the call to ComprehensiveTemperatureGenerator may elapse 
## too long time (more than 5 eseconds) and is not executed  by CRAN check.  
## Please uncomment the following line to run the example on your own PC.
# generation00 <-ComprehensiveTemperatureGenerator(station=vstation[16],
# Tx_all=TEMPERATURE_MAX,Tn_all=TEMPERATURE_MIN,year_min=year_min,year_max=year_max,
# p=p,n_GPCA_iteration=n_GPCA_iter,n_GPCA_iteration_residuals=n_GPCA_iteration_residuals,
# sample="monthly",year_min_sim=year_min_sim,year_max_sim=year_max_sim)




	



