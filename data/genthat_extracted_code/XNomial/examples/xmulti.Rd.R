library(XNomial)


### Name: xmulti
### Title: Perform Multinomial Goodness-Of-Fit Test By Full Enumeration
### Aliases: xmulti

### ** Examples

#
#One of Gregor Mendel's crosses produced four types of pea seeds in the numbers:
#
peas <- c(315, 108, 101, 32)
#
#and he expected them to appear in the ratio of 9:3:3:1 according to his genetic model.
#
expected <- c(9, 3, 3, 1)
#
#Test Mendel's theory using
#
xmulti(peas, expected)
#
#In this example, the number of cases examined was 28956759,
#and it probably took your computer less than half a second.
#To see a histogram of the likelihood ratio statistic, use:
#
xmulti(peas, expected, histobins = TRUE)
#
#The red areas of the histogram represent those outcomes deviating from the expected 9:3:3:1 ratio 
#at least as much as the observed numbers. (Much has been made of the tendency for Mendel's data 
#to fit the expectations better than expected!)
#If you wish to use the standard chisquare statistic as a measure of goodness-of-fit instead 
#of the LLR, use:
#
xmulti(peas, expected, statName="Chisq", histobins=TRUE)



