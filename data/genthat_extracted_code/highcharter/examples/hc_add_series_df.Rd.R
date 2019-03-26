library(highcharter)


### Name: hc_add_series_df
### Title: Shortcut for tidy data frame a la ggplot2/qplot
### Aliases: hc_add_series_df

### ** Examples


## Not run: 
##D require("dplyr")
##D n <- 50
##D df <- data_frame(
##D   x = rnorm(n),
##D   y = x * 2 + rnorm(n),
##D   w =  x^2
##D   )
##D   
##D hc_add_series_df(highchart(), data = df, type = "point", x = x, y = y)
##D hc_add_series_df(highchart(), data = df, type = "point", color = w)
##D hc_add_series_df(highchart(), data = df, type = "point", color = w, size = y)
##D 
##D m <- 50
##D s <- cumsum(rnorm(m))
##D e <- 2 + rbeta(m, 2, 2)
##D 
##D df2 <- data_frame(
##D   var = seq(m),
##D   l = s - e,
##D   h = s + e,
##D   n = paste("I'm point ", var)
##D )
##D 
##D hc_add_series_df(highchart(), data = df2, type = "columnnrange",
##D                  x = var, low = l, high = h, name = n, color = var)
##D 
##D hc_add_series_df(highchart(), iris, "point",
##D                       x = Sepal.Length, y = Sepal.Width, group = Species)
##D 
##D   
##D data(mpg, package = "ggplot2")
##D 
##D # point and scatter is the same
##D hc_add_series_df(highchart(), mpg, "scatter", x = displ, y = cty)
##D hc_add_series_df(highchart(), mpg, "point", x = displ, y = cty,
##D                       group = manufacturer)
##D      
##D 
##D mpgman <- count(mpg, manufacturer)
##D hc_add_series_df(highchart(), mpgman, "columnn", x = manufacturer, y = n) %>% 
##D   hc_xAxis(type = "category")
##D 
##D mpgman2 <- count(mpg, manufacturer, year)
##D hc_add_series_df(highchart(), mpgman2, "bar", x = manufacturer, y = n, group = year) %>% 
##D   hc_xAxis(type = "category")
##D   
##D data(economics, package = "ggplot2")
##D 
##D hc_add_series_df(highchart(), economics, "line", x = date, y = unemploy) %>% 
##D   hc_xAxis(type = "datetime")
##D 
##D data(economics_long, package = "ggplot2")
##D 
##D economics_long2 <- filter(economics_long,
##D                           variable %in% c("pop", "uempmed", "unemploy"))
##D                           
##D hc_add_series_df(highchart(), economics_long2, "line", x = date,
##D                  y = value01, group = variable) %>% 
##D   hc_xAxis(type = "datetime")
##D 
## End(Not run)




