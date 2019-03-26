context("functions")

library(dplyr)
library(ggplot2)
library(smpic)

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

my_temp <- paste0(tempfile(), ".png")

expect_silent({
  smpic_view(p, sm = "facebook_shared_images", text_factor = 2.2)
})

expect_silent({
  smpic_save(p, filename = my_temp,
             sm = "facebook_shared_images", text_factor = 2.2)
  })

expect_true({
  file.exists(my_temp)
})

