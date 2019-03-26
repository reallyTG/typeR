library(facerec)


### Name: get_gallery_subjects
### Title: get gallery subjects
### Aliases: get_gallery_subjects

### ** Examples

## No test: 

facerec_init()

# enroll
finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
finn_enroll <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')

# view subjects
get_gallery_subjects(gallery = 'starwars')
## End(No test)





