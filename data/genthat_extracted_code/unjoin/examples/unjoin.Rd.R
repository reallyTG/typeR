library(unjoin)


### Name: unjoin
### Title: unjoin
### Aliases: unjoin unjoin unjoin.data.frame unjoin unjoin.unjoin unjoin
###   unjoin_ unjoin unjoin_.data.frame unjoin unjoin_.unjoin

### ** Examples

library(dplyr)
data("Seatbelts", package= "datasets")
x <- unjoin(as.data.frame(Seatbelts), front, law)
y <- inner_join(x$.idx0, x$data) %>% select(-.idx0)
all.equal(y[colnames(Seatbelts)], as.data.frame(Seatbelts))

iris %>% unjoin(-Species)
chickwts %>% unjoin(weight)

if (require("gapminder")) {
  gapminder %>%
    group_by(country, continent) %>%
    unjoin()

  gapminder %>%
    unjoin(-country, -continent)
  unjoin(gapminder)
}
unjoin(iris, Petal.Width) %>% unjoin(Species, key_col = ".idx1")



