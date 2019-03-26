library(multipanelfigure)


### Name: images
### Title: Images
### Aliases: images rhino unicorn

### ** Examples

figure <- multi_panel_figure(
  width = c(60, 40, 40), height = c(40, 40, 40)
)
image_files <- system.file("extdata", package = "multipanelfigure") %>%
  dir(full.names = TRUE) %>%
  setNames(basename(.))
figure %>%
  fill_panel(image_files["farouq.tiff"]) %>%
  fill_panel(image_files["unicorn.svg"], column = 2:3) %>%
  fill_panel(image_files["rhino.jpg"], row = 2:3) %>%
  fill_panel(image_files["Rlogo.png"], column = 2:3, row = 2:3)



