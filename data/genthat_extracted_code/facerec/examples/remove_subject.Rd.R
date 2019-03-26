library(facerec)


### Name: remove_subject
### Title: remove subject
### Aliases: remove_subject

### ** Examples

## No test: 

facerec_init()

# enroll
finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
finn_enroll <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')

# remove subject
remove_subject(subject_id = 'finn', gallery = 'starwars')
## End(No test)





