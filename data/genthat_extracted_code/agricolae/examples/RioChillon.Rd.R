library(agricolae)


### Name: RioChillon
### Title: Data and analysis Mother and baby trials
### Aliases: RioChillon
### Keywords: datasets

### ** Examples

# Analisys the Mother/Baby Trial Design
library(agricolae)
data(RioChillon)
# First analysis the Mother Trial Design.
model<-aov(yield ~ block + clon, RioChillon$mother)
anova(model)
cv.model(model)
comparison<-with(RioChillon$mother,LSD.test(yield,clon, 18, 4.922, group=TRUE))
# Second analysis the babies Trial.
comparison<-with(RioChillon$babies,friedman(farmer,clon, yield, group=TRUE))
# Third
# The researcher makes use of data from both mother and baby trials and thereby obtains
# information on suitability of new technologies or cultivars
# for different agro-ecologies and acceptability to farmers.
 



