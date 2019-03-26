library(quokar)


### Name: frame_fn_obs
### Title: Visualization of quantile regression model fitting: interior
###   point algorithm
### Aliases: frame_fn_obs

### ** Examples

library(ggplot2)
library(quantreg)
library(tidyr)
library(dplyr)
library(gridExtra)
data(ais)
tau <- c(0.1, 0.5, 0.9)
object <- rq(BMI ~ LBM + Ht, data = ais, tau = tau, method = 'fn')
fn <- frame_fn_obs(object, tau)
##For tau = 0.1, plot the observations used in quantile regression
##fitting based on interior point method
fn1 <- fn[ ,1]
case <- 1:length(fn1)
fn1 <- cbind(case, fn1)
m <- data.frame(y = ais$BMI, x1 = ais$LBM, x2 = ais$Ht, fn1)
p <- length(attr(object$coefficients, "dimnames")[[1]])
m_f <- m %>% gather(variable, value, -case, -fn1, -y)
mf_a <- m_f %>%
 group_by(variable) %>%
 arrange(variable, desc(fn1)) %>%
 filter(row_number() %in% 1:p )
p1 <- ggplot(m_f, aes(x = value, y = y)) +
 geom_point(alpha = 0.1) +
 geom_point(data = mf_a, size = 3) +
 facet_wrap(~variable, scale = "free_x")
## For tau = 0.5, plot the observations used in quantile regression
##fitting based on interior point method
fn2 <- fn[,2]
case <- 1: length(fn2)
fn2 <- cbind(case, fn2)
m <- data.frame(y = ais$BMI, x1 = ais$LBM, x2 = ais$Ht, fn2)
p <- length(attr(object$coefficients, "dimnames")[[1]])
m_f <- m %>% gather(variable, value, -case, -fn2, -y)
mf_a <- m_f %>%
   group_by(variable) %>%
   arrange(variable, desc(fn2)) %>%
   filter(row_number() %in% 1:p )
p2 <- ggplot(m_f, aes(x = value, y = y)) +
   geom_point(alpha = 0.1) +
   geom_point(data = mf_a, size = 3) +
   facet_wrap(~variable, scale = "free_x")
## For tau = 0.9
fn3 <- fn[,3]
case <- 1: length(fn3)
fn3 <- cbind(case, fn3)
m <- data.frame(y = ais$BMI, x1 = ais$LBM, x2 = ais$Ht, fn3)
p <- length(attr(object$coefficients, "dimnames")[[1]])
m_f <- m %>% gather(variable, value, -case, -fn3, -y)
mf_a <- m_f %>%
  group_by(variable) %>%
  arrange(variable, desc(fn3)) %>%
  filter(row_number() %in% 1:p )
p3 <- ggplot(m_f, aes(x = value, y = y)) +
  geom_point(alpha = 0.1) +
  geom_point(data = mf_a, size = 3) +
  facet_wrap(~variable, scale = "free_x")
grid.arrange(p1, p2, p3, ncol = 1)



