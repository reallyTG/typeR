library(SocialPosition)


### Name: collapse_PCS2003_4l
### Title: The collapsing of the French Professions et Categories
###   Socioprofessionnelles (PCS 2003) from 4 levels
### Aliases: collapse_PCS2003_4l
### Keywords: collapse

### ** Examples

#load the data
data(data_PCS2003_4l)

#visualize the data
str(data_PCS2003_4l)
head(data_PCS2003_4l)

#check the variable PCS2003_4l needed for the conversion
table(data_PCS2003_4l$codes_4_level)

#Then, you can run the function:
data_PCS2003_4l <- collapse_PCS2003_4l(
				   PCS2003_4l=data_PCS2003_4l$codes_4_level,
				   data=data_PCS2003_4l)

#Three variables corresponding each to one different level of collapsing were created:
names(data_PCS2003_4l)
table(data_PCS2003_4l$PCS2003_3l) #3 level
table(data_PCS2003_4l$PCS2003_2l) #2 level
table(data_PCS2003_4l$PCS2003_1l) #1 level



