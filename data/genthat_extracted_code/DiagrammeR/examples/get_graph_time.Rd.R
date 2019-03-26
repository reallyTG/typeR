library(DiagrammeR)


### Name: get_graph_time
### Title: Get the graph date-time or timezone
### Aliases: get_graph_time

### ** Examples

# Create an empty graph and
# set the graph's time; if nothing
# is supplied for the `tz` argument,
# `GMT` is used as the time zone
graph <-
  create_graph() %>%
    set_graph_time(
      time = "2015-10-25 15:23:00")

# Get the graph's time as a POSIXct
# object using `get_graph_time()`
graph %>%
  get_graph_time()



