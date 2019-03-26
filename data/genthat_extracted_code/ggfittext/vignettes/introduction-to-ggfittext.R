## ----doesnt_fit----------------------------------------------------------
library(ggplot2)
library(ggfittext)

flyers <- data.frame(
  vehicle = rep(c("kite", "jumbo jet", "space shuttle", "dyson sphere"), 2),
  xmin = rep(c(52.5, 45, 30, 0), 2),
  xmax = rep(c(67.5, 75, 90, 120), 2),
  ymin = rep(c(0, 15, 35, 60), 2),
  ymax = rep(c(10, 30, 55, 85), 2),
  geom = factor(c(rep("geom_text", 4), rep("geom_fit_text", 4)),
                levels = c("geom_text", "geom_fit_text"))
)

ggplot(flyers, aes(label = vehicle, xmin = xmin, xmax = xmax, ymin = ymin,
                   ymax = ymax)) + 
  geom_rect() +
  geom_text(data = subset(flyers, geom == "geom_text"),
            aes(x = (xmin + xmax) / 2, y = (ymin + ymax) / 2)) +
  geom_fit_text(data = subset(flyers, geom == "geom_fit_text")) +
  facet_wrap( ~ geom) +
  labs(x = "", y = "")

## ----geom_fit_text_2-----------------------------------------------------
ggplot(flyers, aes(label = vehicle, xmin = xmin, xmax = xmax, ymin = ymin,
                   ymax = ymax)) + 
  geom_rect() +
  geom_text(data = subset(flyers, geom == "geom_text"),
            aes(x = (xmin + xmax) / 2, y = (ymin + ymax) / 2)) +
  geom_fit_text(data = subset(flyers, geom == "geom_fit_text"),
                place = "top", min.size = 6) +
  facet_wrap( ~ geom) +
  labs(x = "", y = "")

## ----geom_fit_text_3-----------------------------------------------------
ggplot(flyers, aes(label = vehicle, xmin = xmin, xmax = xmax, ymin = ymin, 
                   ymax = ymax)) +
  geom_rect() +
  geom_text(data = subset(flyers, geom == "geom_text"),
            aes(x = (xmin + xmax) / 2, y = (ymin + ymax) / 2)) +
  geom_fit_text(data = subset(flyers, geom == "geom_fit_text"), grow = T) +
  facet_wrap( ~ geom, ncol = 1) +
  labs(x = "", y = "")

## ----reflow--------------------------------------------------------------
poem <- data.frame(
  text = rep(
    "Whose words these are I think I know.\nHe would prefer that they reflow",
    3
  ),
  xmin = rep(10, 3),
  xmax = rep(90, 3),
  ymin = rep(10, 3),
  ymax = rep(90, 3),
  fit = c("geom_text", "without reflow", "with reflow")
)

ggplot(poem, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax,
                 label = text)) +
  geom_rect() +
  geom_text(
    data = subset(poem, fit == "geom_text"),
    aes(x = (xmin + xmax) / 2, y = (ymin + ymax) / 2)
  ) +
  geom_fit_text(data = subset(poem, fit == "without reflow"), min.size = 0) +
  geom_fit_text(data = subset(poem, fit == "with reflow"), reflow = TRUE,
                min.size = 0) +
  lims(x = c(0, 100), y = c(0, 100)) +
  labs(x = "", y = "") +
  facet_wrap(~ fit)

## ----reflow_and_grow-----------------------------------------------------
film <- data.frame(
  text = rep("duck soup", 3),
  xmin = rep(30, 3),
  xmax = rep(70, 3),
  ymin = rep(0, 3),
  ymax = rep(100, 3),
  fit = c("geom_text", "grow without reflow", "grow with reflow")
)

ggplot(film, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax,
                 label = text)) +
  geom_rect() +
  geom_text(
    data = subset(film, fit == "geom_text"),
    aes(x = (xmin + xmax) / 2, y = (ymin + ymax) / 2)
  ) +
  geom_fit_text(data = subset(film, fit == "grow without reflow"), grow = TRUE) +
  geom_fit_text(
    data = subset(film, fit == "grow with reflow"),
    grow = TRUE,
    reflow = TRUE
  ) +
  lims(x = c(0, 100), y = c(0, 100)) +
  labs(x = "", y = "") +
  facet_wrap(~ fit, ncol = 1)

## ----heatmap, fig.width = 7----------------------------------------------
tournament <- data.frame(
  teamA = rep(c("Radon Canyon Raiders", "Desert Bluffs Destroyers",
                "Old Town Orphans"), 3),
  teamB = c(rep("Coyote Corners Carolers", 3),
            rep("Sand Wastes Streetcleaners", 3),
            rep("Dog park Devils", 3)),
  venue = sample(c("Night Vale Stadium", "Big Rico's Sandlot With The Lot",
                   "Elementary School Playground",
                   "Night Vale Harbor and Waterfront Recreation Area"),
                 9, replace = T),
  game_time_mins = sample(999, 9)
  )

ggplot(tournament, aes(x = teamA, y = teamB, fill = game_time_mins,
                       label = venue)) +
  geom_tile() +
  geom_fit_text(width = grid::unit(30, "mm"), height = grid::unit(15, "mm"), 
                min.size = 0, reflow = T, grow = T, colour = "white")

