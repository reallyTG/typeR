library(riskyr)


### Name: init_txt
### Title: Initialize basic text elements.
### Aliases: init_txt

### ** Examples

init_txt()          # => defines a list of (default) text elements
length(init_txt())  # => 16

# Customizing current text elements:
txt <- init_txt(scen.lbl = "US or Them",
                scen.src = "Some stable genius",
                popu.lbl = "We, the people")




