library(furniture)


### Name: table1
### Title: Table 1 for Simple and Stratified Descriptive Statistics
### Aliases: table1

### ** Examples


## Fictitious Data ##
library(furniture)
library(dplyr)

x  <- runif(1000)
y  <- rnorm(1000)
z  <- factor(sample(c(0,1), 1000, replace=TRUE))
a  <- factor(sample(c(1,2), 1000, replace=TRUE))
df <- data.frame(x, y, z, a)

## Simple
table1(df, x, y, z, a)

## Stratified
## all three below are the same
table1(df, x, y, z,
       splitby = ~ a)
table1(df, x, y, z,
       splitby = "a")

## With Piping
df %>%
  table1(x, y, z, 
         splitby = ~a) 
         
df %>%
  group_by(a) %>%
  table1(x, y, z)

## Adjust variables within function and assign name
table1(df, 
       x2 = ifelse(x > 0, 1, 0), z = z)




