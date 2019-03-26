## ----message=FALSE-------------------------------------------------------
require(dams)
require(ggplot2)
require(maps)
require(mapproj)

## ------------------------------------------------------------------------
dams_all <- nid_cleaned

dim(dams_all)

head(dams_all, 3)

## ------------------------------------------------------------------------
gfx_data <- dams_all[, c("Year_Completed", "State")]

head(gfx_data)

## ------------------------------------------------------------------------
gfx_data$Year <- cut(gfx_data$Year_Completed, 
                     breaks = c(0, 1850, seq(1900, 2000, 10), 2014), 
                     labels = c("<1850", "1850-1900", "1910", "1920", "1930",
                              "1940", "1950", "1960", "1970", "1980", "1990", 
                              "2000", "2014"))
table(gfx_data$Year)

year_counts <- as.data.frame(table(gfx_data$Year), stringsAsFactors = FALSE)
colnames(year_counts) <- c("Year", "Count")

## ------------------------------------------------------------------------
gfx_bar <- ggplot(year_counts, aes(x = Year, y = Count))
gfx_bar <- gfx_bar + geom_bar(position = "dodge", stat = "identity")
gfx_bar <- gfx_bar + ylab("Number of Dams") + xlab("Year of Completion")
gfx_bar <- gfx_bar + ggtitle("Number of Dams in the NID Database")

## ----fig1plot, echo=FALSE, fig.width=8, fig.height=6,fig.align="center"----
plot(gfx_bar)

## ------------------------------------------------------------------------
gfx_data <- subset(gfx_data, !(State %in% c("AK", "HI", "PR", "GU")))
sort(table(gfx_data$State))

## ------------------------------------------------------------------------
state_counts <- as.data.frame(table(gfx_data$State), stringsAsFactors = FALSE)
colnames(state_counts) <- c("state", "Count")

# add long names of states
state_names <- data.frame(state = state.abb, 
                          name = state.name, 
                          stringsAsFactors = FALSE)
gfx_data <- merge(state_counts, state_names, by = "state")
# change state name to lower case to be consistent with ggplot
gfx_data$name <- tolower(gfx_data$name)

# geo reference data on states from ggplot
geo_state <- map_data("state")

# merge data with above for graphics
gfx_data <- merge(geo_state, gfx_data, by.x = "region", by.y = "name")
gfx_data <- gfx_data[order(gfx_data$order), ]

# discretize state counts
color_breaks <- c(0, 100, 500, 1000, 2000, 3000, 4000, 5000, 7500)
color_labels <- c("<100", "100 - 500", "500 - 1000", "1000 - 2000",
                  "2000 - 3000", "3000 - 4000", "4000 - 5000", "5000 - 7500")
gfx_data$dams <- cut(gfx_data$Count, 
                     breaks = color_breaks, 
                     labels = color_labels)

gfx_map <- ggplot(data = gfx_data)
gfx_map <- gfx_map + geom_polygon(aes(x = long, y = lat, group = group,
            fill = dams))
gfx_map <- gfx_map + geom_path(data = geo_state, aes(x = long, y = lat,
            group = group, fill = NA))
gfx_map <- gfx_map + labs(list(title = "Number of Dams in the NID Database",
            x = NULL, y = NULL))
gfx_map <- gfx_map + guides(fill = guide_legend(title = "Number of Dams"))
gfx_map <- gfx_map + scale_fill_brewer(palette = "Accent")
gfx_map <- gfx_map + coord_map()

## ----fig2plot, echo=FALSE, fig.height=6,fig.width=8----------------------
plot(gfx_map)

## ------------------------------------------------------------------------
flood_dams <- subset(dams_all, Primary_Purpose == "Flood Control")

table(flood_dams$State)

