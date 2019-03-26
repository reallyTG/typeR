library(quokar)


### Name: frame_br
### Title: Visualization of quantile regression model fitting: br
###   algorithem
### Aliases: frame_br

### ** Examples

library(ggplot2)
library(quantreg)
data(ais)
tau <- c(0.1, 0.5, 0.9)
object1 <- rq(BMI ~ LBM, tau, method = 'br', data = ais)
data_plot <- frame_br(object1, tau)$all_observation
choose <- frame_br(object1, tau)$fitting_point
ggplot(data_plot,
 aes(x=value, y=data_plot[,2])) +
 geom_point(alpha = 0.1) +
 ylab('y') +
 xlab('x') +
 facet_wrap(~variable, scales = "free_x", ncol = 2) +
 geom_point(data = choose, aes(x = x, y = y,
                                      group = tau_flag,
                                      colour = tau_flag,
                                      shape = obs))

object2 <- rq(BMI ~ Ht + LBM + Wt, tau, method = 'br',
            data = ais)
data_plot <- frame_br(object2, tau)$all_observation
choose <- frame_br(object2, tau)$fitting_point
ggplot(data_plot,
 aes(x=value, y=data_plot[,2])) +
 geom_point(alpha = 0.1) +
 ylab('y') +
 xlab('x') +
 facet_wrap(~variable, scales = "free_x", ncol = 2) +
 geom_point(data = choose, aes(x = x, y = y,
                                      group = tau_flag,
                                      colour = tau_flag,
                                      shape = obs))



