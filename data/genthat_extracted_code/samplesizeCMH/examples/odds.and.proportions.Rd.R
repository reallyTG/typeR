library(samplesizeCMH)


### Name: odds.and.proportions
### Title: Interconvert odds and proportion values
### Aliases: odds.and.proportions prop2odds odds2prop effect.size
###   props2theta rr2theta theta2rr

### ** Examples

# Convert proportions of 0 through 1 to odds
props <- seq(0,1,0.1)
prop2odds(props)

# Convert odds to proportions
odds2prop(1:3)

# Raise a proportion by an effect size theta
effect.size(0.5, 2)

# Find the odds ratio between to proportions
props2theta(0.75, 0.5)



