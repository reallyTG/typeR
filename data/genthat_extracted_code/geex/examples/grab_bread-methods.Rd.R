library(geex)


### Name: grab_bread
### Title: Grabs the .A (bread matrix) slot
### Aliases: grab_bread grab_bread,sandwich_components-method
###   grab_bread,sandwich_components,sandwich_components-method

### ** Examples

myee <- function(data){
 function(theta){
   c(data$Y1 - theta[1],
   (data$Y1 - theta[1])^2 - theta[2])
  }
}

results <- m_estimate(
   estFUN = myee,
   data = geexex,
   root_control = setup_root_control(start = c(1,1)))

grab_bread(results@sandwich_components)



