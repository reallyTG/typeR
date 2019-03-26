library(textshape)


### Name: from_to
### Title: Prepare Discourse Data for Network Plotting
### Aliases: from_to from_to.default from_to.character from_to.numeric
###   from_to.data.frame from_to_summarize

### ** Examples

from_to(DATA, 'person')
from_to_summarize(DATA, 'person')
from_to_summarize(DATA, 'person', c('sex', 'adult'))
## Not run: 
##D if (!require("pacman")) install.packages("pacman"); library(pacman)
##D p_load(dplyr, geomnet, qdap, stringi, scales)
##D p_load_current_gh('trinker/textsahpe')
##D 
##D dat <- from_to_summarize(DATA, 'person', c('sex', 'adult')) %>%
##D     mutate(words = rescale(word.count, c(.5, 1.5)))
##D 
##D dat %>%
##D     ggplot(aes(from_id = from, to_id = to)) +
##D         geom_net(
##D             aes(linewidth = words),
##D             layout.alg = "fruchtermanreingold",
##D             directed = TRUE,
##D             labelon = TRUE,
##D             size = 1,
##D             labelcolour = 'black',
##D             ecolour = "grey70",
##D             arrowsize = 1,
##D             curvature = .1
##D         ) +
##D         theme_net() +
##D         xlim(c(-0.05, 1.05))
## End(Not run)



