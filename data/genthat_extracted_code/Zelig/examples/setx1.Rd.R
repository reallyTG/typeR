library(Zelig)


### Name: setx1
### Title: Setting Explanatory Variable Values for First Differences
### Aliases: setx1
### Keywords: file

### ** Examples

library(dplyr) # contains pipe operator %>%
data(turnout)

# plot first differences
zelig(Fertility ~ Education, data = swiss, model = 'ls') %>%
      setx(z4, Education = 10) %>%
      setx1(z4, Education = 30) %>%
      sim() %>%
      plot()




