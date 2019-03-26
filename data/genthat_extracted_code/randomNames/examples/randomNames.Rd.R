library(randomNames)


### Name: randomNames
### Title: Random Names Function
### Aliases: randomNames
### Keywords: misc models

### ** Examples

randomNames()  ## Returns a single name in "last, first" format

randomNames(5, which.names="first") ## Returns 5 first names

randomNames(5, return.complete.data=TRUE) ## Returns entire data.table

test.df <- data.frame(GENDER=sample(0:1, 100, replace=TRUE),
	ETHNICITY=sample(1:6, 100, replace=TRUE))

test.names <- randomNames(gender=test.df$GENDER,
	ethnicity=test.df$ETHNICITY)

head(test.names)


ethnicities <- c("African American", "Hispanic", "Asian", "White", "Native American")
genders <- c("Female", "Male")

test.df <- data.frame(GENDER=sample(genders, 100, replace=TRUE),
	ETHNICITY=sample(ethnicities, 100, replace=TRUE))

test.names <- randomNames(gender=test.df$GENDER,
	ethnicity=test.df$ETHNICITY)

head(test.names)



