library(funModeling)


### Name: equal_freq
### Title: Equal frequency binning
### Aliases: equal_freq

### ** Examples

## Example 1
summary(heart_disease$age)
age_2=equal_freq(var=heart_disease$age, n_bins = 10)
summary(age_2)

## Example 2
age_3=equal_freq(var=heart_disease$age, n_bins = 5)
summary(age_3)



