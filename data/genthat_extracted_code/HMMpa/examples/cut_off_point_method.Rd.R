library(HMMpa)


### Name: cut_off_point_method
### Title: Cut-Off Point Method for Assigning Physical Activity Patterns
### Aliases: cut_off_point_method
### Keywords: ts

### ** Examples



################################################################
### Fictitious activity counts #################################
################################################################

x <- c(1,16,19,34,22,6,3,5,6,3,4,1,4,3,5,7,9,8,11,11,
  14,16,13,11,11,10,12,19,23,25,24,23,20,21,22,22,18,7,
  5,3,4,3,2,3,4,5,4,2,1,3,4,5,4,5,3,5,6,4,3,6,4,8,9,12,
  9,14,17,15,25,23,25,35,29,36,34,36,29,41,42,39,40,43,
  37,36,20,20,21,22,23,26,27,28,25,28,24,21,25,21,20,21,
  11,18,19,20,21,13,19,18,20,7,18,8,15,17,16,13,10,4,9,
  7,8,10,9,11,9,11,10,12,12,5,13,4,6,6,13,8,9,10,13,13,
  11,10,5,3,3,4,9,6,8,3,5,3,2,2,1,3,5,11,2,3,5,6,9,8,5,
  2,5,3,4,6,4,8,15,12,16,20,18,23,18,19,24,23,24,21,26,
  36,38,37,39,45,42,41,37,38,38,35,37,35,31,32,30,20,39,
  40,33,32,35,34,36,34,32,33,27,28,25,22,17,18,16,10,9,
  5,12,7,8,8,9,19,21,24,20,23,19,17,18,17,22,11,12,3,9,
  10,4,5,13,3,5,6,3,5,4,2,5,1,2,4,4,3,2,1)  


################################################################
### i.) Tradionional cut_point method ##########################
################################################################

### Assigning activity ranges to activity counts using 
### fictitious cut-off points that produce the four activity 
### ranges "sedentary"", "light"", "moderate"", and "vigorous". 
## No test: 
solution_of_traditional_cut_off_point_method <- 
    cut_off_point_method(x = x, 
      cut_points = c(5,15,23), 
      names_activity_ranges = c("SED","LIG","MOD","VIG"), 
      bout_lengths = c(1,1,2,2,3,3,4,4,5,5,6,12,
      13,40,41,265,1,265), 
      plotting = 0)

print(solution_of_traditional_cut_off_point_method)
## End(No test)

###############################################################
### ii.) Extension of the tradionional cut_point method #######
###      using HMMs      ######################################
###############################################################

## The following three steps define an extension of the 
## traditional cut-off method by first extracting the hidden 
## physical activity pattern behind the accelerometer counts 
## using a HMM (those three steps are basically combined in 
## the function HMM_based_method, see HMM_based_method for 
## further details and references): 


### Step 1 ##################################################### 

## Train hidden Markov model for different number of 
## states m=2,...,6 and select the model with the most 
## plausible m
## No test: 
m_trained_HMM <- 
    HMM_training(x = x, 
      min_m = 2, 
      max_m = 6, BW_print=FALSE,
      distribution_class = "pois")$trained_HMM_with_selected_m
## End(No test)

### Step 2 ##################################################### 

## Decode the trained HMM (by using the 
## Viterbi algorithm (global decoding)) to get the estimated 
## sequence of hidden physical activity levels 
## underlying the the accelerometer counts 

## You have to compute 'm_trained_HMM' first (see Step 1)
## No test: 
global_decoding <- 
    HMM_decoding(x = x, 
      m = m_trained_HMM$m, 
      delta = m_trained_HMM$delta, 
      gamma = m_trained_HMM$gamma, 
      distribution_class = m_trained_HMM$distribution_class, 
      distribution_theta = m_trained_HMM$distribution_theta,
      decoding_method = "global")
        
hidden_PA_levels <- 
    global_decoding$decoding_distr_means
## End(No test)

### Step 3 #####################################################

## Assigning activity ranges to activity counts using the 
## information extracted by decoding the HMM for the counts 
## (PA-levels) and fictitious cut-off points that produce 
## four so-called activity ranges:"sedentary", "light", 
## "moderate" and "vigorous":

## You have to compute 'm_trained_HMM' and 
## 'hidden_PA_levels' first (see above)
## No test: 
solution_of_HMM_based_cut_off_point_method <- 
 cut_off_point_method(x = x, 
  hidden_PA_levels = hidden_PA_levels, 
  cut_points = c(5,15,23), 
  names_activity_ranges = c("SED","LIG","MOD","VIG"), 
  bout_lengths = c(1,1,2,2,3,3,4,4,5,5,6,12,13,40,41,265,1,265), 
  plotting=1)
## End(No test)



