library(PCRedux)


### Name: decision_modus
### Title: A function to get a decision (modus) from a vector of classes
### Aliases: decision_modus
### Keywords: decision modus

### ** Examples


# First example
# Enter a string of arbritary of "a","a","y","n"
# Result:
# [1] a
# Levels: a b n y

decision_modus(c("a","a","y","n","b"))

# Second example
# Analyze data from the decision_res_testdat.csv data file
library(data.table)
library(magrittr)
filename <- system.file("decision_res_testdat.csv", package = "PCRedux")
my_data <- as.data.frame(fread(filename))
head(my_data)

dec <- lapply(1L:nrow(my_data), function(i) {
       decision_modus(my_data[i, 2:4])
}) %>% unlist

names(dec) <- my_data[, 1]
dec




