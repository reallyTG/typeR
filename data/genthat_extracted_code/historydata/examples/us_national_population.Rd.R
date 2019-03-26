library(historydata)


### Name: us_national_population
### Title: Population of the United States, 1790-2010
### Aliases: us_national_population
### Keywords: datasets

### ** Examples

head(us_national_population)
if(require(ggplot2)) {
  ggplot(us_national_population,
         aes(x = year, y = population)) +
  geom_line() +
  ggtitle("Population of the United States, 1790-2010")
}



