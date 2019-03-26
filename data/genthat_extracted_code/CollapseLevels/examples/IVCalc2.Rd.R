library(CollapseLevels)


### Name: IVCalc2
### Title: IVCalc2
### Aliases: IVCalc2

### ** Examples


# Load the German_Credit data set supplied with this package

data("German_Credit")

d<-data.frame()

# Call the function as follows

d<-IVCalc2(German_Credit,resp="Good_Bad",bins=10)

# Information Value for all the attributes in the German_Credit data

d





