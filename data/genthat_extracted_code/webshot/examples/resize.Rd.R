library(webshot)


### Name: resize
### Title: Resize an image
### Aliases: resize

### ** Examples

if (interactive()) {
  # Can be chained with webshot() or appshot()
  webshot("https://www.r-project.org/", "r-small-1.png") %>%
    resize("75%")

  # Generate image that is 400 pixels wide
  webshot("https://www.r-project.org/", "r-small-2.png") %>%
    resize("400x")
}



