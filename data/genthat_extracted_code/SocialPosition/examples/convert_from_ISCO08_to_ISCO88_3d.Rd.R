library(SocialPosition)


### Name: convert_from_ISCO08_to_ISCO88_3d
### Title: The conversion of the ISCO 2008 classification into the ISCO
###   1988
### Aliases: convert_from_ISCO08_to_ISCO88_3d
### Keywords: convert

### ** Examples

#load the data
data(data_ISCO2008)

#visualize the data
str(data_ISCO2008)
head(data_ISCO2008)

#check the variable ISCO2008 needed for the conversion
table(data_ISCO2008$ISCO2008)

#Then, you can run the function:
data_ISCO2008 <- convert_from_ISCO08_to_ISCO88_3d(
				 ISCO08=data_ISCO2008$ISCO2008,
				 data=data_ISCO2008)

#Check the created variable:
names(data_ISCO2008)
table(data_ISCO2008$ISCO88_3d)



