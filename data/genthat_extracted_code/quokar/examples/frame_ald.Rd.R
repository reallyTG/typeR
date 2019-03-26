library(quokar)


### Name: frame_ald
### Title: Density function plot of the error term for quantile regression
###   model using asymmetric Laplace distribution
### Aliases: frame_ald

### ** Examples

library(ggplot2)
data(ais)
x <- matrix(ais$LBM, ncol = 1)
y <- ais$BMI
tau = c(0.1, 0.5, 0.9)
ald_data <- frame_ald(y, x, tau, smooth = 10, error = 1e-6,
                  iter = 2000)
ggplot(ald_data) +
   geom_line(aes(x = r, y = d, group = obs, colour = tau_flag)) +
   facet_wrap(~tau_flag, ncol = 1, scale = "free") +
   xlab('') +
   ylab('Asymmetric Laplace Distribution Density Function')




