library(datamaps)


### Name: add_arcs_name
### Title: Add arcs
### Aliases: add_arcs_name

### ** Examples

data <- data.frame(origin = c("USA", "FRA", "CHN", "RUS", "COG", "DZA"),
    target = c("FRA", "RUS", "BEL", "CAF", "VEN", "SWZ"),
    greatArc = rep(c(TRUE, FALSE), 3),
    arcSharpness = 2)

data %>%
    datamaps() %>%
    add_arcs_name(origin, target, greatArc, arcSharpness)

# US states
states <- data.frame(origin = c("AR", "NY", "CA", "IL", "CO", "MT",
                                "TX", "WA", "TN", "MT"),
    target = c("OR", "SD", "WI", "TX", "LA", "AZ", "FL", "MI", "HI",
               "OK"),
    strokeWidth = runif(10, 1, 9),
    strokeColor = colorRampPalette(c("red", "blue"))(10))

states %>%
    datamaps(scope = "USA", default = "lightgray") %>%
    add_arcs_name(origin, target, strokeWidth, strokeColor)




