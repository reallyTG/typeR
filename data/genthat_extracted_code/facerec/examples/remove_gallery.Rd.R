library(facerec)


### Name: remove_gallery
### Title: remove gallery
### Aliases: remove_gallery

### ** Examples

## No test: 


facerec_init()

# enroll
finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
finn_enroll <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')

# remove gallery
remove_gallery(gallery = 'starwars')
## End(No test)





