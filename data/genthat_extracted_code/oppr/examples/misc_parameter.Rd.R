library(oppr)


### Name: misc_parameter
### Title: Miscellaneous parameter
### Aliases: misc_parameter

### ** Examples

# load data
data(iris, mtcars)

# create table parameter can that can be updated to any other object
p1 <- misc_parameter("tbl", iris,
                     function(x) TRUE,
                     function(id, x) structure(id, .Class = "shiny.tag"))
print(p1) # print it
p1$get() # get value
p1$id # get id
p1$validate(mtcars) # check if parameter can be updated
p1$set(mtcars) # set parameter to mtcars
p1$print() # print it again

# create table parameter with validation function that requires
# all values in the first column to be less then 200 and that the
# parameter have the same column names as the iris data set
p2 <- misc_parameter("tbl2", iris,
                     function(x) all(names(x) %in% names(iris)) &&
                                 all(x[[1]] < 200),
                     function(id, x) structure(id, .Class = "shiny.tag"))
print(p2) # print it
p2$get() # get value
p2$id # get id
p2$validate(mtcars) # check if parameter can be updated
iris2 <- iris; iris2[1,1] <- 300 # create updated iris data set
p2$validate(iris2) # check if parameter can be updated
iris3 <- iris; iris2[1,1] <- 100 # create updated iris data set
p2$set(iris3) # set parameter to iris3
p2$print() # print it again




