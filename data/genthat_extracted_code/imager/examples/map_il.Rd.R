library(imager)


### Name: map_il
### Title: Type-stable map for use with the purrr package
### Aliases: map_il map2_il pmap_il

### ** Examples

#Returns a list
imsplit(boats,"x",2) %>% purrr::map(~ isoblur(.,3))
#Returns an "imlist" object
imsplit(boats,"x",2) %>% map_il(~ isoblur(.,3))
#Fails if function returns an object that's not an image
try(imsplit(boats,"x",2) %>% map_il(~ . > 2))
#Parallel maps
map2_il(1:3,101:103,~ imshift(boats,.x,.y))
pmap_il(list(x=1:3,y=4:6,z=7:9),function(x,y,z) imfill(x,y,z))



