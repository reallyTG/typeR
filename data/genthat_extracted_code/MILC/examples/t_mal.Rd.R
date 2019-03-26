library(MILC)


### Name: t_mal
### Title: Predict age at the onset of the first malignant cell
### Aliases: t_mal
### Keywords: Functions

### ** Examples

# The following examples predict the possible ages at the onset of the first 
# malignant cell of:

set.seed(7461) 	
# a man who has never smoked:
   t_mal(runif(1), "male", NA, NA, NA) 

# a man, current smoker,who started smoking at 20 years:
   t_mal(runif(1), "male", 20, NA, 25)

# a man, former smoker, who started and quit smoking at 20 and 50 years respectively, 
# and used to smoke 25 cigarettes per day on average:
   t_mal(runif(1), "male", 20, 50, 25) 



