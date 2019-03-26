library(Luminescence)


### Name: calc_HomogeneityTest
### Title: Apply a simple homogeneity test after Galbraith (2003)
### Aliases: calc_HomogeneityTest

### ** Examples


## load example data
data(ExampleData.DeValues, envir = environment())

## apply the homogeneity test
calc_HomogeneityTest(ExampleData.DeValues$BT998)

## using the data presented by Galbraith (2003)
df <-
 data.frame(
   x = c(30.1, 53.8, 54.3, 29.0, 47.6, 44.2, 43.1),
   y = c(4.8, 7.1, 6.8, 4.3, 5.2, 5.9, 3.0))

calc_HomogeneityTest(df)





