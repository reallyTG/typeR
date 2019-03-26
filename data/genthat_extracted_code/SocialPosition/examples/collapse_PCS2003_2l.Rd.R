library(SocialPosition)


### Name: collapse_PCS2003_2l
### Title: The collapsing of the French Professions et Categories
###   Socioprofessionnelles (PCS 2003) from 2 levels
### Aliases: collapse_PCS2003_2l
### Keywords: collapse

### ** Examples

#load the data
data(data_PCS2003_2l)

#visualize the data
str(data_PCS2003_2l)
head(data_PCS2003_2l)

#check the variable PCS2003_2l needed for the conversion
table(data_PCS2003_2l$codes_2_level)

#Then, you can run the function:
data_PCS2003_2l <- collapse_PCS2003_2l(
				   PCS2003_2l=data_PCS2003_2l$codes_2_level,
				   data=data_PCS2003_2l)

#The corresponding variable was created:
names(data_PCS2003_2l)
table(data_PCS2003_2l$PCS2003_1l)



