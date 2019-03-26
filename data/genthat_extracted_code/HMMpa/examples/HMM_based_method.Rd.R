library(HMMpa)


### Name: HMM_based_method
### Title: Hidden Markov Method for Predicting Physical Activity Patterns
### Aliases: HMM_based_method

### ** Examples


################################################################
### Fictitious activity counts #################################
################################################################

x <- 100 * c(1,16,19,34,22,6,3,5,6,3,4,1,4,3,5,7,9,8,11,11,
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

	   
### Fictitious cut-off points that produce four so-called 
### activity ranges "sedentary", "light", "moderate", 
### and "vigorous".
cut_points <- 100 * c(7,15,23)
names_activity_ranges <- c("SED","LIG","MOD","VIG")


### Plot fictitious activity counts
plot(x, main = "counts with high values", 
     xlab = "time/epoch", ylab = "counts")
abline(h = cut_points, col = "grey50", lty = "dashed")


################################################################
### Comparing the results of the traditional ################### 
### cut-off point method and the new HMM-based method ##########
################################################################

### Apply the traditional cut-off point method to assign 
### physical activity ranges to each observed count
## No test: 
solution_of_tradtionional_cut_off_point_method <-
   cut_off_point_method(x = x, 
       hidden_PA_levels = NA, 
       cut_points = cut_points, 
       names_activity_ranges = names_activity_ranges, 
       bout_lengths = c(1,1,2,2,3,3,4,4,5,5,6,12, 
       13,40,41,265,1,265), 
	     plotting = 1)
## End(No test)
### Apply the HMM-based method to assign physical activity 
### ranges to the hidden physical activity level of each count
## No test: 
solution_of_HMM_based_method <- 
    HMM_based_method(x = x, 
      max_scaled_x = 50, 
      cut_points  =cut_points, 
    	min_m = 2, 
    	max_m = 6, 
    	names_activity_ranges = names_activity_ranges, 
      distribution_class = "pois", 
      training_method = "EM", 
      decoding_method = "global", 
      bout_lengths = c(1,1,2,2,3,3,4,4,5,5,6,12,
      13,40,41,265,1,265), 
      plotting = 1)

		
### Print details of the traditional cut-off point method 
### and the new HMM-based method
print(solution_of_tradtionional_cut_off_point_method)
print(solution_of_HMM_based_method)
## End(No test)



