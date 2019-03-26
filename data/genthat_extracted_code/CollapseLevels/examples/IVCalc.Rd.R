library(CollapseLevels)


### Name: IVCalc
### Title: IVCalc
### Aliases: IVCalc

### ** Examples


# Load the German_Credit data set supplied with this package

data("German_Credit")

l<-list()

# Call the function as follows

l<-IVCalc(German_Credit,resp="Good_Bad",bins=10)

# Information Value for  the attribute Account_Balance in the German_Credit data

l$Account_Balance





