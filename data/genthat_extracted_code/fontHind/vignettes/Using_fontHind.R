## ----install,eval=FALSE--------------------------------------------------
#  
#  install.packages('hrbrthemes')
#  
#  if(!require(devtools)) {
#    install.packages("devtools")
#  }
#  devtools::install_github('bhaskarvk/fontHind')
#  fontHind::import_hind() # Required only once

## ----eg1, fig.retina=1, fig.width=6, fig.height=4------------------------
library(ggplot2)
library(fontHind)

gg <- ggplot(mtcars, aes(mpg, wt)) +
  geom_point() +
  labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
       title="Seminal ggplot2 scatterplot example",
       subtitle="A plot that is only useful for demonstration purposes",
       caption="Brought to you by the letter 'g'")

gg + theme_ipsum_hind()

