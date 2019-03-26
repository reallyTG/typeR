## ---- include = FALSE----------------------------------------------------
# load NOAAWeather package
library(NOAAWeather)

## ------------------------------------------------------------------------
# print only the first 20 rows of the response:
knitr::kable(
  head(getWeatherData(online = TRUE, location = "Austin", state="TX", from = "2018-01-01", to = "2018-01-02", range = 100),20))

## ----fig.width = 9,fig.height = 8----------------------------------------

plot_calhmap(online = TRUE, from = "2017-01-01", to = "2017-01-31", 
             measure = "t_max", location = "Wolf Point", state = "MT",
             text = TRUE)


## ----fig.width = 9,fig.height = 8----------------------------------------

plot_spatial(online=FALSE, Date="2017-01-10", measure="t_max")


