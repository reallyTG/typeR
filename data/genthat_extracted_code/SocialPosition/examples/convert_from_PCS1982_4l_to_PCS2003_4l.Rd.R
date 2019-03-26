library(SocialPosition)


### Name: convert_from_PCS1982_4l_to_PCS2003_4l
### Title: The conversion of the French PCS 1982 into the French PCS 2003
### Aliases: convert_from_PCS1982_4l_to_PCS2003_4l
### Keywords: convert

### ** Examples

#load the data
data(data_PCS1982)

#visualize the data
str(data_PCS1982)
head(data_PCS1982)

#check the variable PCS1982 needed for the conversion
table(data_PCS1982$PCS1982)

#Then, you can run the function:
data_PCS1982 <- convert_from_PCS1982_4l_to_PCS2003_4l(
				PCS1982_4l=data_PCS1982$PCS1982,
				data=data_PCS1982)

#Check the variables created:
names(data_PCS1982)
table(data_PCS1982$PCS2003_4l) # CSP 2003 4 digits (4 niveaux)
table(data_PCS1982$PCS2003_3l) # CSP 2003 3 digits (3 niveaux)
table(data_PCS1982$PCS2003_2l) # CSP 2003 2 digits (2 niveaux)
table(data_PCS1982$PCS2003_1l) # CSP 2003 1 digit (1 niveau)



