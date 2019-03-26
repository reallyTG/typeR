library(geex)


### Name: grab_meat_list
### Title: Gets the .B_i (list of bread matrices) slot
### Aliases: grab_meat_list grab_meat_list,sandwich_components-method
###   grab_meat_list,sandwich_components,sandwich_components-method
###   grab_ee_list,sandwich_components-method
###   grab_meat_list,sandwich_components,sandwich_components-method

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

head(grab_meat_list(results@sandwich_components))



