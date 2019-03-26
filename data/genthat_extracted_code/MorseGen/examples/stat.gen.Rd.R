library(MorseGen)


### Name: stat.gen
### Title: stat.gen
### Aliases: stat.gen
### Keywords: datagen

### ** Examples

# In a study published in Body Image on the 
# effects of massage on state (temporary) body 
# image, Dunigan, King, & Morse (2011) that there 
# were no significant differences in body mass 
# index scores (BMI) between the control (n=26, 
# M=25.26, SD=6.51) and experimental (n=23, M=23.30, 
# SD=5.83) conditions as a check for potential confounds.
# We can use MorseGen to generate a sample of raw scores 
# to match these statistics and use this data as a 
# teaching example for an independent samples t-test in an 
# introductory statistics course. 

# Generate the control group data.
# I set non.neg=TRUE because the supplied descriptive 
# statistics could return a negative value (0 is within 4 standard 
# deviations from each mean) and BMI cannot be negative.
# Note that the output file "MorseGen Sample Results.txt" will 
# overwrite the data with each run of the stat.gen function so 
# the scores must be copied out or saved as a different file name 
# after each run.

stat.gen(26, 25.26, 6.51, data.dec=2, neg.data=FALSE, x.name="Control")

#To generate the experimental group data

stat.gen(23, 23.30, 5.83, data.dec=2, neg.data=FALSE, x.name="Massage")



