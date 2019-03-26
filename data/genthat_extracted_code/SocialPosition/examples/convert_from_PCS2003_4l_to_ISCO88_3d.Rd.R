library(SocialPosition)


### Name: convert_from_PCS2003_4l_to_ISCO88_3d
### Title: The conversion of the French PCS 2003 into the ISCO 1988 codes
### Aliases: convert_from_PCS2003_4l_to_ISCO88_3d
### Keywords: convert

### ** Examples

#load the data
data(data_PCS2003_4l)

#visualize the data
str(data_PCS2003_4l)
head(data_PCS2003_4l)

#check the variable needed for the conversion
table(data_PCS2003_4l$codes_4_level)

#Then, you can run the function:
data_PCS2003_4l <- convert_from_PCS2003_4l_to_ISCO88_3d(
				   PCS2003_4l=data_PCS2003_4l$codes_4_level, 
				   data=data_PCS2003_4l)

#Check the variable created:
names(data_PCS2003_4l)
table(data_PCS2003_4l$ISCO88_3d)



