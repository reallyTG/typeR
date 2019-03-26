library(vpc)


### Name: new_vpc_theme
### Title: Create a customized VPC theme
### Aliases: new_vpc_theme

### ** Examples

theme1 <- new_vpc_theme(update = list(
  obs_color = "red",
  obs_ci_color = "#aa0000",
  obs_alpha = .3,
  sim_pi_fill = "#cc8833",
  sim_pi_size = 2
))
vpc(simple_data$sim, simple_data$obs, vpc_theme = theme1)




