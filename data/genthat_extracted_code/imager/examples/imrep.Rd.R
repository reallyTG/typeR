library(imager)


### Name: imrep
### Title: Replicate images
### Aliases: imrep

### ** Examples

#Result is a list
imrep(boats,3) %>% plot
#Result is an image 
imrep(boats,3,"x") %>% plot
#Make an animation by repeating each frame 10x
#map_il(1:5,~ isoblur(boats,.) %>% imrep(10,"z")) %>%
#                       imappend("z") %>% play



