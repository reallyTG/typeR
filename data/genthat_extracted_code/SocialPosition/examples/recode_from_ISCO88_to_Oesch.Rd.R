library(SocialPosition)


### Name: recode_from_ISCO88_to_Oesch
### Title: The recoding of the Oesch class schema from ISCO 1988 codes
### Aliases: recode_from_ISCO88_to_Oesch
### Keywords: recode

### ** Examples

#load the data
data(data_MCH2007)

#visualize the data
str(data_MCH2007)
head(data_MCH2007)

#check the variables needed for social position coding
table(data_MCH2007$nb_emp_SE,useNA="always")
table(data_MCH2007$iscoR,useNA="always")

#Then, you can run the function:
data_MCH2007 <- recode_from_ISCO88_to_Oesch(
				ISCO88=data_MCH2007$iscoR, 
				EMP_STA=data_MCH2007$nb_emp_SE, 
				SE_zero_emp=0, 
				SE_one_to_nine_emp=1:9, 
				SE_ten_plus_emp=10:100, 
				not_SE=NA, 
				data=data_MCH2007) 

#Three variables were created:
names(data_MCH2007)
head(data_MCH2007)
table(data_MCH2007$Oesch17,useNA="always")
table(data_MCH2007$Oesch8,useNA="always")
table(data_MCH2007$emplnum,useNA="always")

#If you don't need the 'emplnum' variable, you can delete it by writing:
data_MCH2007$emplnum <- NULL



