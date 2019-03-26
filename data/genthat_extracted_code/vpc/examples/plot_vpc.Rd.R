library(vpc)


### Name: plot_vpc
### Title: VPC plotting function
### Aliases: plot_vpc

### ** Examples

## See vpc.ronkeizer.com for more documentation and examples

library(vpc)
vpc_db <- vpc(sim = simple_data$sim, obs = simple_data$obs, vpcdb = TRUE)
plot_vpc(vpc_db, title = "My new vpc", x = "Custom x label")



