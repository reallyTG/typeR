library(imager)


### Name: imchange
### Title: Modify parts of an image
### Aliases: imchange

### ** Examples

#Set border to 0:
imchange(boats,px.borders(boats,10),~ 0) %>% plot
#Eq. to
im <- boats
im[px.borders(im,10)] <- 0
#Using formula syntax
imchange(boats,~ px.borders(.,10),~ 0)
#Replace with grayscale ramp
imchange(boats,~ px.borders(.,10),~ xs) %>% plot
#Kill red channel in image
imchange(boats,~ c==1,~ 0) %>% plot
#Shit hue by an amount depending on eccentricity
load.example("parrots") %>%
  RGBtoHSL %>%
  imchange(~ c==1,~ .+80*exp(-(rho/550)^2) ) %>%
  HSLtoRGB %>%
  plot




