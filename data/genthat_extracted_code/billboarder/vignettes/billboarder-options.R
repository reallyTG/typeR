## ----setup, echo=FALSE---------------------------------------------------
library("billboarder")

## ----title---------------------------------------------------------------
billboarder() %>% 
  bb_barchart(table(sample(letters[1:6], 50, TRUE))) %>% 
  bb_title(text = "My title", position = "center")

## ----color_palette-------------------------------------------------------
data("prod_par_filiere")
prod_par_filiere[, c(1, 3, 4, 5, 6, 8)]

# Default
billboarder() %>% 
  bb_barchart(data = prod_par_filiere[, c(1, 3, 4, 5, 6, 8)])

# RColorBrewer palette
library("RColorBrewer")
billboarder() %>% 
  bb_barchart(data = prod_par_filiere[, c(1, 3, 4, 5, 6, 8)]) %>% 
  bb_color(palette = brewer.pal(n = 5, name = "Dark2"))

## ----color_manual--------------------------------------------------------
billboarder() %>% 
  bb_barchart(data = prod_par_filiere[, c(1, 3, 4, 5, 6, 8)]) %>% 
  bb_colors_manual(
    prod_therm = "maroon",
    prod_hydraulique = "royalblue",
    prod_bioenergies = "forestgreen",
    prod_eolien = "plum",
    prod_solaire = "goldenrod"
  )

## ----bar_color_manual----------------------------------------------------
billboarder() %>% 
  bb_barchart(data = prod_par_filiere[, c(1, 4)], color = "grey") %>% 
  bb_bar_color_manual(values = c("2015" = "firebrick"))

## ----axis_label----------------------------------------------------------
# data source : wikipedia
sw <- data.frame(
  film = c("The Force Awakens", "The Phantom Menace",
           "Revenge of the Sith", "A New Hope", 
           "Attack of the Clones", "The Empire Strikes Back", 
           "Return of the Jedi"),
  worldwide_gross = c(2068178225, 1027044677, 848754768,
                      775398007, 649398328, 538375067, 475106177)
)

billboarder() %>% 
  bb_barchart(data = sw) %>% 
  bb_y_axis(label = list(text = "Worldwide grosses", position = "outer-middle"))


## ----axis_label_format---------------------------------------------------
billboarder() %>% 
  bb_barchart(data = sw) %>% 
  bb_y_axis(tick = list(
    values = c(0, 5e+08, 1e+09, 1.5e+09, 2e+09),
    outer = FALSE,
    format = htmlwidgets::JS("d3.formatPrefix('$,.0', 1e6)")
  ))

## ----axis_label_suffix---------------------------------------------------
sw2 <- sw
# calculate percentage
sw2$percent <- sw2$worldwide_gross / sum(sw2$worldwide_gross) * 100
sw2$percent <- round(sw2$percent)

sw2$worldwide_gross <- NULL

billboarder() %>% 
  bb_barchart(data = sw2) %>% 
  bb_y_axis(tick = list(format = suffix("%")))

## ----xaxis_label_format--------------------------------------------------
data("cdc_prod_filiere")
billboarder() %>% 
  bb_linechart(data = cdc_prod_filiere[, c("date_heure", "prod_solaire")]) %>% 
  bb_x_axis(tick = list(format = "%H:%M", fit = FALSE))

## ----axis_min------------------------------------------------------------
billboarder() %>% 
  bb_linechart(data = cdc_prod_filiere[, c("date_heure", "prod_solaire")]) %>% 
  bb_y_axis(min = 0, padding = 0)

## ----legend_off----------------------------------------------------------
df <- data.frame(
  cos = cos(seq(-pi, pi, length.out = 30))
)

# No legend
billboarder() %>% 
  bb_linechart(data = df) %>% 
  bb_legend(show = FALSE)

## ----legend_name---------------------------------------------------------
billboarder() %>% 
  bb_linechart(data = df) %>% 
  bb_data(names = list(cos = "Cosine"))

## ----legend_position-----------------------------------------------------
df$sin <- sin(seq(-pi, pi, length.out = 30))

billboarder() %>% 
  bb_linechart(data = df) %>% 
  bb_legend(position = "right")

billboarder() %>% 
  bb_linechart(data = df) %>% 
  bb_legend(position = "inset", inset = list(anchor = "top-left"))

## ----grids---------------------------------------------------------------
billboarder() %>% 
  bb_linechart(data = df) %>%
  bb_y_grid(show = TRUE) %>% 
  bb_x_grid(show = TRUE)

## ----hlines--------------------------------------------------------------
billboarder() %>% 
  bb_linechart(data = df) %>%
  bb_y_grid(lines = list(
    list(value = 0, text = "Zero")
  ))

## ----tooltip_grouped-----------------------------------------------------
billboarder() %>% 
  bb_linechart(data = df) %>%
  bb_tooltip(grouped = FALSE)

## ----tooltip_format------------------------------------------------------
billboarder() %>% 
  bb_barchart(data = sw) %>% 
  bb_tooltip(format = list(
    name =  htmlwidgets::JS("function(name, ratio, id, index) {return 'Worldwide grosses';}"),
    value = htmlwidgets::JS("d3.format('$,')")
  ))


## ----options_all---------------------------------------------------------
billboarder() %>% 
  bb_barchart(data = sw, color = "#CAD5DB") %>% 
  bb_bar_color_manual(values = c("A New Hope" = "#112446")) %>% 
  bb_legend(show = FALSE) %>% 
  bb_y_grid(show = TRUE) %>% 
  bb_y_axis(tick = list(
    values = c(0, 5e+08, 1e+09, 1.5e+09, 2e+09),
    outer = FALSE,
    format = htmlwidgets::JS("d3.formatPrefix('$,.0', 1e6)")
  )) %>% 
  bb_tooltip(format = list(
    name =  htmlwidgets::JS("function(name, ratio, id, index) {return 'Worldwide grosses';}"),
    value = htmlwidgets::JS("d3.format('$,')")
  )) %>% 
  bb_labs(
    title = "Star Wars - Total Lifetime Grosses", 
    y = "Worldwide grosses",
    caption = "Data source : wikipedia"
  )

