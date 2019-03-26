library(cleanerR)


### Name: NA_VALUES
### Title: 'NA_VALUES' Asks for a dataframe and returns a table of how many
###   missing values are in each collum
### Aliases: NA_VALUES

### ** Examples

#This function is used to detect how many NA values are in a dataframe
# the use is pretty much always the same
#Lets consider the dataset iris
i=iris
print(NA_VALUES(i)  )
#Since it has no missing values it shows none, now lets insert some NA_VALUES there
i[sample(1:nrow(i),0.3*nrow(i)),1]=NA
i[sample(1:nrow(i),0.2*nrow(i)),2]=NA
i[sample(1:nrow(i),0.5*nrow(i)),3]=NA
print(NA_VALUES(i))
#For every dataframe the user just uses this



