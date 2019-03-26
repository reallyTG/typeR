library(MorseGen)


### Name: cor.gen
### Title: cor.gen
### Aliases: cor.gen
### Keywords: datagen

### ** Examples

# In a study published in Body Image on the effects 
# of massage on state (temporary) body image, Dunigan, 
# King, & Morse (2011) reported that their observed 
# correlation between body mass index scores (BMI) and 
# body image state scores (BISS) to be -.56 for their 
# 49 participants. We can use cor.gen to generate a sample 
# of raw scores to match these statistics and use this 
# data as a teaching example for Pearson correlations in 
# an introductory statistics course. 

# To generate the data

cor.gen(49, 24.38, 6.22, 5.16, 1.47, -.56, data.dec=2, x.name="BMI", y.name="BISS") 



