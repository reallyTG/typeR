library(processanimateR)


### Name: renderer_graphviz
### Title: Render as a plain graph This renderer uses viz.js to render the
###   process map using the DOT layout.
### Aliases: renderer_graphviz

### ** Examples

data(example_log)

# Animate the process with the default GraphViz DOT renderer
animate_process(example_log, renderer = renderer_graphviz())




