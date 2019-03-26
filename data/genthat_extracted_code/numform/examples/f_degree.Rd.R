library(numform)


### Name: f_fahrenheit
### Title: Format Degrees (e.g., Temperature, Coordinates)
### Aliases: f_fahrenheit f_celcius f_longitude f_latitude f_degree
###   ff_degree ff_celcius ff_fahrenheit ff_longitude ff_latitude

### ** Examples

## used for ggplot2 axis.text & legend scale
f_celcius(37, type = 'scale')

## used for ggplot2 geom_text
f_celcius(37, type = 'text')

## used for ggplot2 titles
f_celcius(prefix = "My Title",  type = 'title')

## used for table and string formatting
f_celcius(37, type = 'string')
f_celcius(37, type = 'string', symbol = '\\textdegree')  # LaTeX

## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(tidyverse, maps, viridis, mapproj)
##D 
##D states <- map_data("state")
##D arrests <- USArrests
##D names(arrests) <- tolower(names(arrests))
##D arrests$region <- tolower(rownames(USArrests))
##D choro <- merge(states, arrests, sort = FALSE, by = "region")
##D choro <- choro[order(choro$order), ]
##D 
##D ggplot(choro, aes(long, lat)) +
##D     geom_polygon(aes(group = group, fill = assault)) +
##D     coord_map("albers",  at0 = 45.5, lat1 = 29.5) +
##D     scale_y_continuous(labels = f_latitude) +
##D     scale_x_continuous(labels = f_longitude)
##D 
##D ggplot(choro, aes(long, lat)) +
##D     geom_polygon(aes(group = group, fill = assault)) +
##D     coord_map("albers",  at0 = 45.5, lat1 = 29.5) +
##D     scale_y_continuous(labels = ff_latitude(suffix = FALSE)) +
##D     scale_x_continuous(labels = ff_longitude(suffix = FALSE))
##D 
##D 
##D world <- map_data(map="world")
##D 
##D ggplot(world, aes(map_id = region, x = long, y = lat)) +
##D     geom_map(map = world, aes(map_id = region), fill = "grey40",
##D         colour = "grey70", size = 0.25) +
##D     scale_y_continuous(labels = f_latitude) +
##D     scale_x_continuous(labels = f_longitude)
##D 
##D 
##D data_frame(
##D     Event = c('freezing water', 'room temp', 'body temp', 'steak\'s done',
##D         'hamburger\'s done', 'boiling water'),
##D     F = c(32, 70, 98.6, 145, 160, 212)
##D ) %>%
##D     mutate(
##D         C = (F - 32) * (5/9),
##D         Event = f_title(Event),
##D         Event = factor(Event, levels = unique(Event))
##D     ) %>%
##D     ggplot(aes(Event, F, fill = F)) +
##D         geom_col() +
##D         geom_text(aes(y = F + 4, label = f_fahrenheit(F, digits = 1, type = 'text')),
##D             parse = TRUE, color = 'grey60') +
##D         scale_y_continuous(
##D             labels = f_fahrenheit, limits = c(0, 220), expand = c(0, 0),
##D             sec.axis = sec_axis(trans = ~(. - 32) * (5/9), labels = f_celcius,
##D             name = f_celcius(prefix = 'Temperature ', type = 'title'))
##D         ) +
##D         scale_x_discrete(labels = ff_replace(pattern = ' ', replacement = '\n')) +
##D         scale_fill_viridis(option =  "magma", labels = f_fahrenheit, name = NULL) +
##D         theme_bw() +
##D         labs(
##D             y = f_fahrenheit(prefix = 'Temperature ', type = 'title'),
##D             title = f_fahrenheit(prefix = 'Temperature of Common Events ', type = 'title')
##D         ) +
##D         theme(
##D             axis.ticks.x = element_blank(),
##D             panel.border = element_rect(fill = NA, color = 'grey80'),
##D             panel.grid.minor.x = element_blank(),
##D             panel.grid.major.x = element_blank()
##D         )
##D 
##D 
##D data_frame(
##D     Event = c('freezing water', 'room temp', 'body temp', 'steak\'s done',
##D         'hamburger\'s done', 'boiling water', 'sun surface', 'lighting'),
##D     F = c(32, 70, 98.6, 145, 160, 212, 9941, 50000)
##D ) %>%
##D     mutate(
##D         Event = f_title(Event),
##D         C = (F - 32) * (5/9)
##D     ) %>%
##D     mutate(
##D         F = f_degree(F, measure = 'F', type = 'string'),
##D         C = f_degree(C, measure = 'C', type = 'string', zero = '0.0')
##D     )  %>%
##D     data.frame(stringsAsFactors = FALSE, check.names = FALSE) %>%
##D     pander::pander(split.tables = Inf, justify = alignment(.))
## End(Not run)



