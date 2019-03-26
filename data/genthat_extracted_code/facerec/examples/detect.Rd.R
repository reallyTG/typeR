library(facerec)


### Name: detect
### Title: detect faces
### Aliases: detect

### ** Examples

## No test: 

 facerec_init()

 # one image
 finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
 faces <- detect(image = finn_image)

 # multiple images
 sw_image <- 'https://upload.wikimedia.org/wikipedia/en/8/82/Leiadeathstar.jpg'
 padme_image <- 'https://upload.wikimedia.org/wikipedia/en/e/ee/Amidala.png'

 faces <- c(finn_image, sw_image, padme_image) %>%
 purrr::map(detect) %>% dplyr::bind_rows()
 
## End(No test)






