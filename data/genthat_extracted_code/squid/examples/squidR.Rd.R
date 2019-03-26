library(squid)


### Name: squidR
### Title: Run SQuID without graphical user interface
### Aliases: squidR

### ** Examples

## create the input list ##
input <- list()

## define the model input parameters ##

input$Tmax <- 100 # 100 time steps
input$NP   <- 10  # 10 replicated populations
input$NI   <- 20  # 20 individuals per replicate population
input$NT   <- 1   # 1 trait per individual

# in this simulation model, only one environmental gradient (x1) is added

# turn on the environmental gradient x1
input$X1_state      <- TRUE  

# add a stochastic environmental effect to the environmental effect x1
input$X1_sto_state  <- TRUE  

# the stochastic environmental effect included 
# into the environmental effect x1 is not shared among individual. 
# Each individual will experience a  different stochastic environmental effect. 
input$X1_sto_shared <- FALSE                  

#  add an autocorrelation effect to the stochastic 
#  environmental effect within the environmental effect x1.
input$X1_sto_autocor_state <- FALSE 

# define the autocorrelation value between two consecutive time steps.
input$X1_sto_corr          <- 0.5 

# add a linear trend to the environmental effect x1. 
# the default parameters for the linear trend will be used 
# (an intercept of 0, a slope of 1 and the linear trend will be shared among individuals)
input$X1_lin_state <- TRUE 

# define the population mean values vector.
# the population mean (fixed intercept) and
# the population mean response to environmental influences x1 (fixed slope) 
# are set to 0.1.
input$B    <- c(0.1, 0.1, 0, 0)
                                                  
# define the individual variance/correlation matrix (squared matrix; 4x4)
# the individual-specific deviation (random intercept; VI) variance is set to 0.7.
# the individual-specific response to an environmental effect x1 (random slope; VS1) is set to 0.5.
# the correlation between the individual-specific deviation (I) 
# and the individual-specific response 
# to an environmental effect x1 
# (S1) is set to -0.7.                                                     
input$Vind <- matrix(c(0.7  , 0   , 0 , 0,
                       -0.7 , 0.5 , 0 , 0,
                       0    , 0   , 0 , 0,
                       0    , 0   , 0 , 0), 
			nrow=4, byrow=TRUE)
                       
input$Ve  <- 0.05 # the measurement error variance

## define the sampling design ##

# the mean number of records per individual
input$NR     <- 10
# the among-individual variance in timing of sampling
input$Vhsi   <- 0.2
# individuals are not sampled the same number of times.
input$NR_ind <- FALSE 
# individuals are not sampled at the time
input$ST_ind <- FALSE 

## run the simulation ##
output <- squidR(input, plot=TRUE)

# plot the individual phenotype values over time
print(output$plot$totPhen) 

# see first records of the simulated data set
head(output$full_data)

## run a second simulation with the identical world but with a different sampling design 
## where individuals are sampled the same number of times and at the same time    

input$NR_ind <- TRUE # individuals are sampled the same number of times.
input$ST_ind <- TRUE # individuals are sampled at the time

output2 <- squidR(input, plot=TRUE, data=output$full_data)




