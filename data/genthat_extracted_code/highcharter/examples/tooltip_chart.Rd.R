library(highcharter)


### Name: tooltip_chart
### Title: Helper to create charts in tooltips.
### Aliases: tooltip_chart

### ** Examples



## Not run: 
##D require(dplyr)
##D require(purrr)
##D require(tidyr)
##D require(gapminder)
##D data(gapminder, package = "gapminder")
##D 
##D gp <- gapminder %>%
##D   arrange(desc(year)) %>%
##D   distinct(country, .keep_all = TRUE)
##D 
##D gp2 <- gapminder %>%
##D   nest(-country) %>%
##D   mutate(data = map(data, mutate_mapping, hcaes(x = lifeExp, y = gdpPercap), drop = TRUE),
##D          data = map(data, list_parse)) %>%
##D   rename(ttdata = data)
##D 
##D gptot <- left_join(gp, gp2)
##D 
##D hc <- hchart(
##D         gptot,
##D         "point",
##D         hcaes(
##D           lifeExp,
##D           gdpPercap,
##D           name = country,
##D           size = pop,
##D           group = continent
##D           )
##D        ) %>%
##D   hc_yAxis(type = "logarithmic")
##D 
##D hc %>%
##D   hc_tooltip(useHTML = TRUE, pointFormatter = tooltip_chart(accesor = "ttdata"))
##D 
##D hc %>%
##D   hc_tooltip(useHTML = TRUE, pointFormatter = tooltip_chart(
##D     accesor = "ttdata",
##D     hc_opts = list(chart = list(type = "column"))
##D   ))
##D 
##D hc %>%
##D   hc_tooltip(
##D     useHTML = TRUE,
##D     positioner = JS("function () { return { x: this.chart.plotLeft + 10, y: 10}; }"),
##D     pointFormatter = tooltip_chart(
##D       accesor = "ttdata",
##D       hc_opts = list(
##D         title = list(text = "point.country"),
##D         xAxis = list(title = list(text = "lifeExp")),
##D         yAxis = list(title = list(text = "gdpPercap")))
##D       )
##D     )
##D 
##D hc %>%
##D   hc_tooltip(
##D     useHTML = TRUE,
##D     pointFormatter = tooltip_chart(
##D       accesor = "ttdata",
##D       hc_opts = list(
##D         legend = list(enabled = TRUE),
##D         series = list(list(color = "gray", name = "point.name"))
##D       )
##D     )
##D   )
##D  
## End(Not run)




