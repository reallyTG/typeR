library(facerec)


### Name: verify
### Title: verify face
### Aliases: verify

### ** Examples


## No test: 

facerec_init()

# enroll
padme_image <- 'https://upload.wikimedia.org/wikipedia/en/e/ee/Amidala.png'
padme_face <- enroll(image = padme_image, subject_id = 'padme', gallery = 'starwars')

# verify
amidala_img <- 'https://upload.wikimedia.org/wikipedia/it/5/5e/Padm%C3%A9_Amidala.png'
verified <- verify(image = amidala_img, subject_id = 'padme', gallery = 'starwars')

## End(No test)




