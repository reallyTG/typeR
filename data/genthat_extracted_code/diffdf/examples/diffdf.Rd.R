library(diffdf)


### Name: diffdf
### Title: diffdf
### Aliases: diffdf

### ** Examples

x <- subset( iris,  -Species)
x[1,2] <- 5
COMPARE <- diffdf( iris, x)
print( COMPARE )
print( COMPARE , "Sepal.Length" )

#### Sample data frames

DF1 <- data.frame(
    id = c(1,2,3,4,5,6),
    v1 = letters[1:6],
    v2 = c(NA , NA , 1 , 2 , 3 , NA)
)

DF2 <- data.frame(
    id = c(1,2,3,4,5,7),
    v1 = letters[1:6],
    v2 = c(NA , NA , 1 , 2 , NA , NA),
    v3 = c(NA , NA , 1 , 2 , NA , 4)
)

diffdf(DF1 , DF1 , keys = "id")

# We can control matching with scale/location for example:

DF1 <- data.frame(
    id = c(1,2,3,4,5,6),
    v1 = letters[1:6],
    v2 = c(1,2,3,4,5,6)
)
DF2 <- data.frame(
    id = c(1,2,3,4,5,6),
    v1 = letters[1:6],
    v2 = c(1.1,2,3,4,5,6)
)

diffdf(DF1 , DF2 , keys = "id")
diffdf(DF1 , DF2 , keys = "id", tolerance = 0.2)
diffdf(DF1 , DF2 , keys = "id", scale = 10, tolerance = 0.2)
 
# We can use strict_factor to compare factors with characters for example:

DF1 <- data.frame(
    id = c(1,2,3,4,5,6),
    v1 = letters[1:6],
    v2 = c(NA , NA , 1 , 2 , 3 , NA), 
    stringsAsFactors = FALSE
)

DF2 <- data.frame(
    id = c(1,2,3,4,5,6),
    v1 = letters[1:6],
    v2 = c(NA , NA , 1 , 2 , 3 , NA)
)

diffdf(DF1 , DF2 , keys = "id", strict_factor = TRUE)
diffdf(DF1 , DF2 , keys = "id", strict_factor = FALSE)
 



