library(processanimateR)


### Name: token_aes
### Title: Tokens aesthetics mapping
### Aliases: token_aes

### ** Examples

data(example_log)

# Change default token sizes / shape
animate_process(example_log, mapping = token_aes(size = token_scale(12), shape = "rect"))
## No test: 
# Change default token color
animate_process(example_log, mapping = token_aes(color = token_scale("red")))

# Change default token opacity
animate_process(example_log, mapping = token_aes(opacity = token_scale("0.2")))

# Change default token image (GIFs work too)
animate_process(example_log,
   mapping = token_aes(shape = "image",
    size = token_scale(10),
    image = token_scale("https://upload.wikimedia.org/wikipedia/en/5/5f/Pacman.gif")))

# A more elaborate example with a secondary data frame
library(eventdataR)
data(traffic_fines)
# Change token color based on a numeric attribute, here the nonsensical 'time' of an event
animate_process(edeaR::filter_trace_frequency(bupaR::sample_n(traffic_fines,1000),percentage=0.95),
  legend = "color", mode = "relative",
  mapping = token_aes(color = token_scale("amount",
                                          scale = "linear",
                                          range = c("yellow","red"))))
## End(No test)




