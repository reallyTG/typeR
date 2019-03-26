library(SimRVPedigree)


### Name: sim_life
### Title: Simulate all life events
### Aliases: sim_life

### ** Examples

data(AgeSpecific_Hazards)
my_HR <- hazard(hazardDF = AgeSpecific_Hazards)

# The following commands simulate all life events for an individual, who
# has NOT inherited a causal variant, born in 1900.  From the output, this
# individual has two children, one in 1921 and another in 1923, and then
# dies in 1987.
set.seed(135)
sim_life(hazard_rates = my_HR, GRR = 10,
         carrier_prob = 0.002,
         RV_status = FALSE,
         YOB = 1900, stop_year = 2000)

# Using the same random seed, notice how life events can vary for
# someone who has inherited the causal variant, which carries a
# relative-risk of 10. From the output, this individual also has
# two children, but then experiences disease onset in 1974,
# and dies in 1976.
set.seed(135)
sim_life(hazard_rates = my_HR, GRR = 10,
               carrier_prob = 0.002,
               RV_status = TRUE,
               YOB = 1900, stop_year = 2000)




