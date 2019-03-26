library(facerec)


### Name: get_galleries
### Title: list galleries
### Aliases: get_galleries

### ** Examples

## No test: 

facerec_init()

# enroll
finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
first_gallery <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')
second_gallery <- enroll(image = finn_image, subject_id = 'finn', gallery = 'more_starwars')

# get_galleries
get_galleries()
## End(No test)





