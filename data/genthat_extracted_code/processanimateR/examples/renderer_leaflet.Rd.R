library(processanimateR)


### Name: renderer_leaflet
### Title: Render as graph on a geographical map
### Aliases: renderer_leaflet

### ** Examples

data(example_log)

# Animate the example process with activities placed in some locations
animate_process(example_log,
  renderer = renderer_leaflet(
    node_coordinates = data.frame(
       act = c("A", "B", "C", "D", "Start", "End"),
       lat = c(63.443680, 63.426925, 63.409207, 63.422336, 63.450950, 63.419706),
       lng = c(10.383625, 10.396972, 10.406418, 10.432119, 10.383368, 10.252347),
       stringsAsFactors = FALSE),
    edge_coordinates = data.frame(
       act_from = c("B"),
       act_to = c("C"),
       lat = c(63.419207),
       lng = c(10.386418),
       stringsAsFactors = FALSE),
    options = list(center = c(63.412273, 10.399590), zoom = 12)),
  duration = 5, repeat_count = Inf)




