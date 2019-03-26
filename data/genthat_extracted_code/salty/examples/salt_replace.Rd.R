library(salty)


### Name: salt_replace
### Title: Replace certain patterns into some values in a vector
### Aliases: salt_replace

### ** Examples


x <- c("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
       "Nunc finibus tortor a elit eleifend interdum.",
       "Maecenas aliquam augue sit amet ultricies placerat.")

salt_replace(x, replacement_shaker$capitalization, p = 0.5, rep_p = 0.2)

salt_ocr(x, p = 1, rep_p = 0.5)



