library(SocialPosition)


### Name: recode_from_ISCO88_to_ISEI
### Title: The recoding of the ISEI index from ISCO 1988 codes
### Aliases: recode_from_ISCO88_to_ISEI
### Keywords: recode

### ** Examples

#load the data
data(data_MCH2007)

#visualize the data
str(data_MCH2007)
head(data_MCH2007)

#check the variables needed for social position coding
table(data_MCH2007$iscoR,useNA="always")

#Then, you can run the function:
data_MCH2007 <- recode_from_ISCO88_to_ISEI(
				ISCO88=data_MCH2007$iscoR, 
				data=data_MCH2007) 

#Check the variable created:
names(data_MCH2007)
head(data_MCH2007)
table(data_MCH2007$ISEI,useNA="always")



