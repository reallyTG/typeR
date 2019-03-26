library(MILC)


### Name: ht_mal_int
### Title: Integrating hazard for the onset of th 1st malignant cell
### Aliases: ht_mal_int
### Keywords: Functions

### ** Examples

# The following examples calculate the probability of a man, who on average smokes 
# 30 cigarettes per day, to develop the first malignant cell:
ht_mal_int(0, 50, "male", 30, "Y")	# before the age of 50
ht_mal_int(0, 75, "male", 30, "Y")	# before the age of 75
ht_mal_int(45, 75, "male", 30, "Y")	# between the ages of 45 and 75



