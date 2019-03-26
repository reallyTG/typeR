library(ggforce)


### Name: facet_wrap_paginate
### Title: Split facet_wrap over multiple plots
### Aliases: facet_wrap_paginate

### ** Examples

ggplot(diamonds) +
    geom_point(aes(carat, price), alpha = 0.1) +
    facet_wrap_paginate(~ cut:clarity, ncol = 3, nrow = 3, page = 4)




