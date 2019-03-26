library(XNomial)


### Name: xmonte
### Title: Perform Multinomial Goodness-Of-Fit Test By Monte-Carlo
###   Simulations
### Aliases: xmonte

### ** Examples

#One of Gregor Mendel's crosses produced four types of pea seeds in the numbers as follows:
peas <- c(315, 108, 101, 32)
#and he expected them to appear in the ratio of 9:3:3:1 according to his genetic model.
expected <- c(9, 3, 3, 1)
#Test Mendels theory using
xmonte(peas, expected)
#To see a histogram of the likelihood ratio statistic, use:
xmonte(peas, expected, histobins = TRUE)
#The red areas of the histogram represent those outcomes deviating from the expected 9:3:3:1 ratio 
#at least as much as the observed numbers. (Much has been made of the tendency for Mendel's data 
#to fit the expectations better than expected!)
#If you wish to use the standard chisquare statistic as a measure of goodness-of-fit instead 
#of the LLR, use:
xmonte(peas, expected, statName="Chisq", histobins=TRUE)



