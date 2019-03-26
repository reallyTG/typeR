library(ivpack)


### Name: robust.se
### Title: robust.se
### Aliases: robust.se
### Keywords: ~kwd1 ~kwd2

### ** Examples

### This is the IV model in panel A, column (5) of Table 3 from Card, 1995, "Using 
### Geographic Variation in College Proximity to Esimate the Return from Schooling"
data(card.data)
ivmodel=ivreg(lwage ~ educ + exper + expersq + black + south + smsa + reg661 + reg662 + 
reg663 + reg664 + reg665+ reg666 + reg667 + reg668 + smsa66, ~ nearc4 + exper + 
expersq + black + south + smsa + reg661+ reg662 + reg663 + reg664 + reg665 + reg666 + 
reg667 + reg668 + smsa66, x=TRUE, data=card.data)
robust.se(ivmodel)



