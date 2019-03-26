library(SocialPosition)


### Name: collapse_PCS2003_3l
### Title: The collapsing of the French Professions et Categories
###   Socioprofessionnelles (PCS 2003) from 3 levels
### Aliases: collapse_PCS2003_3l
### Keywords: collapse

### ** Examples

#load the data
data(data_PCS2003_3l)

#visualize the data
str(data_PCS2003_3l)
head(data_PCS2003_3l)

#check the variable PCS2003_3l needed for the conversion
table(data_PCS2003_3l$codes_3_level)

#Then, you can run the function:
data_PCS2003_3l <- collapse_PCS2003_3l(
				   PCS2003_3l=data_PCS2003_3l$codes_3_level,
				   data=data_PCS2003_3l)

#Two variables corresponding each to one different level of collapsing were created:
names(data_PCS2003_3l)
table(data_PCS2003_3l$PCS2003_2l) #CSP 2003 on 2 levels
table(data_PCS2003_3l$PCS2003_1l) #CSP 2003 on 1 level



