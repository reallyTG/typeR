library(bsplus)


### Name: bs_append.bsplus_carousel
### Title: Carousel
### Aliases: bs_append.bsplus_carousel bs_carousel

### ** Examples

bs_carousel(id = "with_the_beatles") %>%
  bs_append(content = bs_carousel_image(src = "img/john.jpg")) %>%
  bs_append(content = bs_carousel_image(src = "img/paul.jpg")) %>%
  bs_append(content = bs_carousel_image(src = "img/george.jpg")) %>%
  bs_append(content = bs_carousel_image(src = "img/ringo.jpg"))




