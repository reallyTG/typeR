library(facerec)


### Name: recognize
### Title: recognize face
### Aliases: recognize

### ** Examples

 ## No test: 

facerec_init()

# enroll
finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
padme_image <- 'https://upload.wikimedia.org/wikipedia/en/e/ee/Amidala.png'
finn_face <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')
padme_face <- enroll(image = padme_image, subject_id = 'padme', gallery = 'starwars')

# recognize
finn_2 <- 'https://upload.wikimedia.org/wikipedia/commons/b/b6/John_Boyega_by_Gage_Skidmore.jpg'
finn_rec <- recognize(image = finn_2, gallery = 'starwars')

## End(No test)



