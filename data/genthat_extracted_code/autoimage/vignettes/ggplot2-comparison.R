## ----setup 1, include = FALSE--------------------------------------------
library(knitr)
opts_knit$set(global.par = TRUE)

## ----setup, include=FALSE------------------------------------------------
library(autoimage)
library(ggplot2)
par(mar = c(3.1, 2.1, 2.1, 1.1))
# knitr::opts_chunk$set(out.width = '50%', out.height = '50%')

## ------------------------------------------------------------------------
data(narccap)
dates <- c("May 15, 2041", "May 16, 2041", "May 17, 2041", "May 18, 2041", "May 19, 2041")

## ---- fig.height=4, fig.width=4------------------------------------------
autoimage(x = lon, y = lat, z = tasmax, main = dates)

## ---- fig.height=2, fig.width=2------------------------------------------
df1 <- data.frame(lon = c(lon[65:75, 50:60]), lat = c(lat[65:75, 50:60]), 
                  tasmax = c(tasmax[65:75, 50:60, 1]))
ggplot(df1, aes(x = lon, y = lat, z = tasmax, fill = tasmax)) + geom_tile()

## ------------------------------------------------------------------------
data(inarccap)

## ------------------------------------------------------------------------
igrid <- expand.grid(ilon, ilat)
df <- data.frame(lon = igrid[,1], lat = igrid[,2], 
                 tasmax = c(itasmax),
                 day = rep(dates, each = 16100)) 

## ---- fig.height=3, fig.width=5------------------------------------------
ggplot(df, aes(x = lon, y = lat, fill = tasmax)) + geom_tile() + 
  facet_wrap(~ day) 

## ---- fig.height=4, fig.width=4------------------------------------------
library(viridis)
ggplot(df, aes(x = lon, y = lat, fill = tasmax)) + 
  geom_tile() + facet_wrap(~ day) + scale_fill_viridis(na.value = "transparent") + 
  theme_bw() + theme(legend.position = "bottom")

## ---- fig.height=4, fig.width=4------------------------------------------
autoimage(x = lon, y = lat, z = tasmax, main = dates, 
          proj = "bonne", parameters = 45)

## ------------------------------------------------------------------------
# ggplot(df, aes(x = lon, y = lat, fill = tasmax)) + geom_tile() + 
#   facet_wrap(~ day) + scale_fill_viridis() + theme_bw() + 
#   coord_map(projection = "bonne", parameters = 45) + 
#   theme(legend.position = "bottom")

## ---- fig.height=4, fig.width=4------------------------------------------
autoimage(x = lon, y = lat, z = tasmax, main = dates, map = "world")

## ---- fig.height=4, fig.width=4------------------------------------------
world_df <- map_data("world")
ggplot() + geom_tile(aes(x = lon, y = lat, fill = tasmax), data = df) + 
  facet_wrap(~ day) + scale_fill_viridis() + theme_bw() + 
  geom_path(aes(x = long, y = lat, group = group), data = world_df) +
  xlim(c(-160, -34)) + ylim(c(20.5, 73.1)) + 
  theme(legend.position = "bottom")

## ------------------------------------------------------------------------
data(canada)
library(broom)
canada_df <- tidy(canada)

## ---- fig.height=4, fig.width=4------------------------------------------
autoimage(x = lon, y = lat, z = tasmax, main = dates, lines = canada)

## ---- fig.height=4, fig.width=4------------------------------------------
ggplot() + geom_tile(aes(x = lon, y = lat, fill = tasmax), data = df) + 
  facet_wrap(~ day) + scale_fill_viridis() + 
  geom_path(aes(x = long, y = lat, group = group), data = canada_df) + 
  theme_bw() + theme(legend.position = "bottom")

## ------------------------------------------------------------------------
caps <- us.cities[us.cities$capital == 2, ]
caps <- caps[c(1, 3, 5, 22, 27, 42), ]
cap_df <- data.frame(x = caps$lon, y = caps$lat, labels = caps$country.etc)

## ---- fig.height=4, fig.width=4------------------------------------------
autoimage(x = lon, y = lat, z = tasmax, main = dates, text = cap_df)

## ---- fig.height=4, fig.width=4------------------------------------------
ggplot() + geom_tile(aes(x = lon, y = lat, fill = tasmax), data = df) + 
  facet_wrap(~ day) + scale_fill_viridis() + 
  geom_text(aes(x = x, y = y, label = labels), data = cap_df) + 
  theme_bw() + theme(legend.position = "bottom")

## ---- fig.height=5, fig.width=5------------------------------------------
autoimage(lon, lat, tasmax, common.legend = FALSE, main = dates)

## ---- fig.height=5, fig.width=5------------------------------------------
df_days = split(df, f = df$day)
p1 <- ggplot(df_days[[1]], aes(x = lon, y = lat, fill = tasmax)) + 
  geom_tile() + labs(title = dates[1]) + 
  theme(legend.position = "bottom")
p2 <- ggplot(df_days[[2]], aes(x = lon, y = lat, fill = tasmax)) + 
  geom_tile() + labs(title = dates[2]) + 
  theme(legend.position = "bottom")
p3 <- ggplot(df_days[[3]], aes(x = lon, y = lat, fill = tasmax)) + 
  geom_tile() + labs(title = dates[3]) + 
  theme(legend.position = "bottom")
p4 <- ggplot(df_days[[4]], aes(x = lon, y = lat, fill = tasmax)) + 
  geom_tile() + labs(title = dates[4]) + 
  theme(legend.position = "bottom")
p5 <- ggplot(df_days[[5]], aes(x = lon, y = lat, fill = tasmax)) + 
  geom_tile() + labs(title = dates[5]) + 
  theme(legend.position = "bottom")
library(gridExtra)
grid.arrange(p1, p2, p3, p4, p5, nrow = 2, ncol = 3)

