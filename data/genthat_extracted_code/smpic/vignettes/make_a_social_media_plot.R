## ---- message=FALSE, warning=FALSE---------------------------------------
library(dplyr)
library(ggplot2)
library(smpic)

## ------------------------------------------------------------------------
p <- ggplot(iris) +
  geom_point(aes(Petal.Length, Petal.Width, color = Species), show.legend = FALSE) +
  geom_label(data = summarise_if(group_by(iris, Species), is.numeric, mean),
             aes(Petal.Length, Petal.Width, label = Species, color = Species),
             show.legend = FALSE) +
  labs(x = "Petal Length", y = "Petal Width",
       title = "Look mom, a flower plot!",
       subtitle = "Yet another iris data set visualization.",
       caption = "Source: iris") +
  theme_minimal()

## ---- fig_height=5, fig_width=7------------------------------------------
p

## ---- fig_height=5, fig_width=7------------------------------------------
smpic_view(p, sm = "facebook_shared_images", text_factor = 2.2)

## ---- fig_height=5, fig_width=7------------------------------------------
smpic_view(p, sm = "twitter_in-stream_photo", text_factor = .8)

## ---- eval=FALSE---------------------------------------------------------
#  smpic_save(p, filename = "my_new_social_media_plot.png",
#             sm = "facebook_shared_images", text_factor = 2.2)

