library(reshape)


### Name: rename
### Title: Rename
### Aliases: rename
### Keywords: manip

### ** Examples
rename(mtcars, c(wt = "weight", cyl = "cylinders"))
a <- list(a = 1, b = 2, c = 3)
rename(a, c(b = "a", c = "b", a="c")) 

# Example supplied by Timothy Bates
names <- c("john", "tim", "andy")
ages <- c(50, 46, 25)
mydata <- data.frame(names,ages)
names(mydata) #-> "name",  "ages"

# lets change "ages" to singular.
# nb: The operation is not done in place, so you need to set your 
# data to that returned from rename

mydata <- rename(mydata, c(ages="age"))
names(mydata) #-> "name",  "age"


