library(facerec)


### Name: prep_image
### Title: prepare local image
### Aliases: prep_image

### ** Examples

 ## No test: 

 facerec_init()

 # download example image
 finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
 temp_img_path <- tempfile(fileext = '.png')
 download.file(finn_image, temp_img_path, mode = 'wb', quiet = TRUE)

 # prepare image
 finn_local <- prep_image(temp_img_path)

 # use prepared image
 faces <- detect(image = finn_local)
 
## End(No test)




