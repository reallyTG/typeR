library(datamaps)


### Name: add_choropleth
### Title: Add choropleth
### Aliases: add_choropleth

### ** Examples

data <- data.frame(name = c("USA", "FRA", "CHN", "RUS", "COG", "DZA"),
    color = round(runif(6, 1, 10)))

data %>%
    datamaps() %>%
    add_choropleth(name, color, colors = c("skyblue", "yellow", "orangered"))

# categorical colors
cat <- data.frame(name = c("USA", "BRA", "COL", "CAN", "ARG", "CHL"),
    col = rep(c("Yes", "No"), 6))

cat %>%
    datamaps(projection = "orthographic") %>%
    add_choropleth(name, col, colors = c("red", "blue"))

# US states
states <- data.frame(st = c("AR", "NY", "CA", "IL", "CO", "MT", "TX"),
    val = c(10, 5, 3, 8, 6, 7, 2))

states %>%
    datamaps(scope = "usa", default = "lightgray") %>%
    add_choropleth(st, val) %>%
    add_labels()




