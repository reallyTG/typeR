library(phonTools)


### Name: vowelplot
### Title: Plot Vowels
### Aliases: vowelplot

### ** Examples

## A few examples of some vowel plots. 

data (pb52)
par (mfrow = c(1,4), mar = c(4.2,4.2,1,1))

# standard layout with linear axes
vowelplot (pb52$f1, pb52$f2, pb52$vowel, xsampa = TRUE)

# alternate layout with log axes
vowelplot (pb52$f1, pb52$f2, pb52$vowel, logaxes = 'xy', 
alternateAxes = TRUE, xsampa = TRUE)

# category means only 
vowelplot (pb52$f1, pb52$f2, pb52$vowel, logaxes = 'xy', 
meansOnly = TRUE, xsampa = TRUE)

# category means only with standard deviation ellipses
vowelplot (pb52$f1, pb52$f2, pb52$vowel, logaxes = 'xy', meansOnly = TRUE,
           ellipses = TRUE, xsampa = TRUE)



