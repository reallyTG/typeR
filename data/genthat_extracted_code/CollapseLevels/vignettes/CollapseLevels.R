## ------------------------------------------------------------------------
library(CollapseLevels)

data("German_Credit")

str(German_Credit)


## ------------------------------------------------------------------------

data("German_Credit")

# Create an empty list to hold the data structures returned by numericToCategorical

l<-list()

l<-levelsCollapser(German_Credit,resp="Good_Bad",bins=10)

# dset holds the data set
# German_Credit is the data set
# resp specifies the name of the binary response variable in the data set
# bins denotes the number of bins for categorizing/binning numeric variables
# Default value for the parameter bin is 10
# If you are supplying default values for bin  , the parameter need not be specified in the function 
# The function returns a list.
# For every attribute in the data set , the list contains a table thats shows the response rates
# by the levels of the attribute
# Collapse levels with similar response percentages.

l$Credit_History


## ------------------------------------------------------------------------
# Create an empty list to hold the data structures returned by numericToCategorical
l<-list()

# Call the function numericToCategorical to categorize the numeric attribute Duration
# dset holds the data set
# German_Credit is the data set
# col specifies the name of the numeric variable we want to categorize
# resp specifies the name of the binary response variable 
# bins denotes the number of bins
# adjFactor denotes what is to be added to the response or non_response values for
# a level of the attribute if the response or non_response is zero for that level


l<-numericToCategorical(dset=German_Credit,col="Duration",resp="Good_Bad",bins=10,adjFactor=0.5)

# Default value of bins is 10, and that of adjFactor is 0.5.
# If you are supplying default values for these parameters , then they need not be specified in the
# function call
#  l$categoricalVariable gives the binned categorized variable. 
#  A bin [a,b) denotes >=a and <b
#  A bin [a,b] denotes >=a and <=b

head(l$categoricalVariable)

#  l$IVTable gives  the Information values of the levels of the binned categorized variable

l$IVTable

#  l$IV gives the Information Value for the binned categorized variable

l$IV

#  l$collapseLevels  gives a table of the response rates by the levels of the categorized variable
#  Levels with similar response rates may be collapsed

l$collapseLevels



## ------------------------------------------------------------------------

# Create an empty data frame 
l<-list()

# dset holds the data set
# German_Credit is the data set
# resp specifies the name of the binary response variable in the data set
# bins denotes the number of bins
# Default value for the parameter bin is 10
# adjFactor denotes what is to be added to the response or non_response values for
# a level of the attribute if the response or non_response is zero for that level
# Default value of bins is 10, and that of adjFactor is 0.5.
# If you are supplying default values for these parameters , then they need not be specified in the
# function call
# The function returns a data frame.
# For every attribute, the function displays the information values for the attribute


d<-IVCalc2(dset=German_Credit,resp="Good_Bad")


d

## ------------------------------------------------------------------------

# Create an empty list to hold the data structures returned by IVCalc function
l<-list()

# dset holds the data set
# German_Credit is the data set
# resp specifies the name of the binary response variable in the data set
# bins denotes the number of bins
# Default value for the parameter bin is 10
# adjFactor denotes what is to be added to the response or non_response values for
# a level of the attribute if the response or non_response is zero for that level
# Default value of bins is 10, and that of adjFactor is 0.5.
# If you are supplying default values for these parameters , then they need not be specified in the
# function call
# The function returns a list.
# For every attribute, the function displays the information values by levels of the
# attribute . It also displays the Information Value for the entire attribute

l<-IVCalc(dset=German_Credit,resp="Good_Bad")

#Explore Information Values for the attribute Credit_History

l$Credit_History


## ------------------------------------------------------------------------

# dset holds the data set
# German_Credit is the data set
# col specifies the name of the variable for which we want to display the Weight of Evidence values
# resp specifies the name of the binary response variable in the data set
# bins denotes the number of bins
# Default value for the parameter bin is 10
# adjFactor denotes what is to be added to the response or non_response values for
# a level of the attribute if the response or non_response is zero for that level
# Default value of bins is 10, and that of adjFactor is 0.5.
# If you are supplying default values for these parameters , then they need not be specified in the
# function call

# Display the Weight of Evidence for the levels of the Job attribute

displayWOE(German_Credit,col="Job",resp="Good_Bad")



## ------------------------------------------------------------------------

# dset holds the data set
# German_Credit is the data set
# col specifies the name of the variable for which we want to display the response percents
# resp specifies the name of the binary response variable in the data set
# bins denotes the number of bins
# Default value for the parameter bin is 10
# adjFactor denotes what is to be added to the response or non_response values for
# a level of the attribute if the response or non_response is zero for that level
# Default value of bins is 10, and that of adjFactor is 0.5.
# If you are supplying default values for these parameters , then they need not be specified in the
# function call

# Display the response percentages for the levels of the Account_Balance attribute

displayResponseRatebyLevels(German_Credit,col="Account_Balance",resp="Good_Bad")



## ------------------------------------------------------------------------

# dset holds the data set
# German_Credit is the data set
# col specifies the name of the variable for which we want to display the IV values
# resp specifies the name of the binary response variable in the data set
# bins denotes the number of bins
# Default value for the parameter bin is 10
# adjFactor denotes what is to be added to the response or non_response values for
# a level of the attribute if the response or non_response is zero for that level
# Default value of bins is 10, and that of adjFactor is 0.5.
# If you are supplying default values for these parameters , then they need not be specified in the
# function call

# Display the IV values for the levels of the Account_Balance attribute

displayIV(German_Credit,col="Account_Balance",resp="Good_Bad")



