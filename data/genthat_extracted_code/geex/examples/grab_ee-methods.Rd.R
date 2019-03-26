library(geex)


### Name: grab_ee_list
### Title: Gets the .ee_i (observed estimating function) slot
### Aliases: grab_ee_list

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

grab_ee_list(results@sandwich_components)



