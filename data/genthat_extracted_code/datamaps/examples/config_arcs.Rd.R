library(datamaps)


### Name: config_arcs
### Title: Configure arcs
### Aliases: config_arcs

### ** Examples

edges <- data.frame(origin = c("USA", "FRA", "BGD", "ETH", "KHM",
                               "GRD", "FJI", "GNB", "AUT", "YEM"),
    target = c("BRA", "USA", "URY", "ZAF", "SAU", "SVK", "RWA", "SWE",
               "TUV", "ZWE"))

edges %>%
    datamaps() %>%
    add_arcs_name(origin, target) %>%
    config_arcs(stroke.color = "blue", stroke.width = 2, arc.sharpness = 1.5,
                animation.speed = 1000)




