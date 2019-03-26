## ---- echo = FALSE, message = FALSE--------------------------------------
require(ghibli)

knitr::opts_chunk$set(
  comment = "#",
    error = FALSE,
     tidy = FALSE,
    cache = FALSE,
 collapse = TRUE,
 fig.width = 5)

## ----palettes------------------------------------------------------------

# see palette names and colours
par(mfrow=c(7,3))
for(i in names(ghibli_palettes)) print(ghibli_palette(i))


## ---- ggplot-marnie------------------------------------------------------

library(ggplot2)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_jitter(size = 3) +
  scale_color_manual(values = rev(ghibli_palette("MarnieMedium1"))) +
  theme_minimal() +
  labs(title="Marnie Medium (1) Palette Test",
       subtitle="A plot that is only useful for demonstration purposes")


