## ----setup, include=TRUE-------------------------------------------------

## ------------------------------------------------------------------------
library(mlbgameday)
library(dplyr)

# Grap some Gameday data. We're specifically looking for Jake Arrieta's no-hitter.
gamedat <- get_payload(start = "2016-04-21", end = "2016-04-21")

# Subset that atbat table to only Arrieta's pitches and join it with the pitch table.
pitches <- inner_join(gamedat$pitch, gamedat$atbat, by = c("num", "url")) %>%
    subset(pitcher_name == "Jake Arrieta")


## ------------------------------------------------------------------------
library(ggplot2)

# basic example
ggplot() +
    geom_point(data=pitches, aes(x=px, y=pz, shape=type, col=pitch_type)) +
    coord_equal() + geom_path(aes(x, y), data = mlbgameday::kzone)


## ---- fig.show='hold'----------------------------------------------------

# basic example with stand.
ggplot() +
    geom_point(data=pitches, aes(x=px, y=pz, shape=type, col=pitch_type)) +
    facet_grid(. ~ stand) + coord_equal() +
    geom_path(aes(x, y), data =  mlbgameday::kzone)



## ------------------------------------------------------------------------
# Subset the data to only called strikes.
strikes <- subset(pitches, des == "Called Strike")

library(pitchRx)
library(viridis)
pitchRx::strikeFX(pitches, geom = "tile") + 
    facet_grid(pitcher_name ~ stand) +
    coord_equal() +
    theme_bw() +
    scale_fill_viridis()


## ------------------------------------------------------------------------
library(plotly)
plot_ly(pitches, x = ~px, y = ~pz, mode = 'markers', 
        color = ~pitch_type, marker = list(size = 7, line = list(color = ~pitch_type, width = 1)),
        text = ~paste("Pitch Type: ", pitch_type)) %>% 
    layout(title = "Anatomy of a No-Hitter", xaxis = list(zeroline=F), yaxis = list(zeroline=F)) %>%
    # Draw a box for the strikezone. 
    layout(shapes = list(type = "rect", fillcolor = "blue", 
                         line = list(color = "blue"), opacity = 0.2,
                         x0 = -0.95, x1 = 0.95, xref = "x",
                         y0 = 3.5, y1 = 1.6, yref = "y"))


