library(DiagrammeR)


### Name: filter_graph_series
### Title: Subset a graph series object
### Aliases: filter_graph_series

### ** Examples

# Create three graphs
graph_time_1 <-
  create_graph(
    graph_name = "graph_with_time_1") %>%
  set_graph_time(
    time = "2015-03-25 03:00",
    tz = "GMT")

graph_time_2 <-
  create_graph(
    graph_name = "graph_with_time_2") %>%
  set_graph_time(
    time = "2015-03-26 03:00",
    tz = "GMT")

graph_time_3 <-
  create_graph(
    graph_name = "graph_with_time_3") %>%
  set_graph_time(
    time = "2015-03-27 15:00",
    tz = "GMT")

# Create an empty graph series and add
# the graphs
series_temporal <-
  create_graph_series(
    series_type = "temporal") %>%
  add_graph_to_graph_series(
    graph = graph_time_1) %>%
  add_graph_to_graph_series(
    graph = graph_time_2) %>%
  add_graph_to_graph_series(
    graph = graph_time_3)

# Subset graph series by sequence
series_sequence_subset <-
  filter_graph_series(
    graph_series = series_temporal,
    by = "number",
    values = 2)

# Get a count of graphs in
# the series
series_sequence_subset %>%
  count_graphs_in_graph_series()

# Subset graph series by date-time
series_time_subset <-
  filter_graph_series(
    graph_series = series_temporal,
    by = "time",
    values = c("2015-03-25 12:00",
               "2015-03-26 12:00"),
    tz = "GMT")

# Get a count of graphs in
# the series
series_time_subset %>%
  count_graphs_in_graph_series()



