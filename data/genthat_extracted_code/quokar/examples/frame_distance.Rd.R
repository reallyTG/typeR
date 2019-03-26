library(quokar)


### Name: frame_distance
### Title: Residual-robust distance plot of quantile regression model
### Aliases: frame_distance

### ** Examples

library(quantreg)
library(ggplot2)
library(ALDqr)
library(purrr)
library(robustbase)
library(tidyr)
library(gridExtra)
tau = c(0.1, 0.5, 0.9)
ais_female <- subset(ais, Sex == 1)
object <- rq(BMI ~ LBM + Ht, data = ais_female, tau = tau)
plot_distance <- frame_distance(object, tau = c(0.1, 0.5, 0.9))
distance <- plot_distance[[1]]
cutoff_v <- plot_distance[[2]]
cutoff_h <- plot_distance[[3]]
n <- nrow(object$model)
case <- rep(1:n, length(tau))
distance <- cbind(case, distance)
distance$residuals <- abs(distance$residuals)
distance1 <- subset(distance, tau_flag == "tau0.1")
p1 <- ggplot(distance1, aes(x = rd, y = residuals)) +
 geom_point() +
 geom_hline(yintercept = cutoff_h[1], colour = "red") +
 geom_vline(xintercept = cutoff_v, colour = "red") +
 geom_text(data = subset(distance1, residuals > cutoff_h[1]|rd > cutoff_v),
           aes(label = case), hjust = 0, vjust = 0) +
 xlab("Robust Distance") +
 ylab("|Residuals|")

distance2 <- subset(distance, tau_flag == "tau0.5")

p2 <- ggplot(distance1, aes(x = rd, y = residuals)) +
 geom_point() +
 geom_hline(yintercept = cutoff_h[2], colour = "red") +
 geom_vline(xintercept = cutoff_v, colour = "red") +
 geom_text(data = subset(distance1, residuals > cutoff_h[2]|rd > cutoff_v),
          aes(label = case), hjust = 0, vjust = 0) +
 xlab("Robust Distance") +
 ylab("|Residuals|")
distance3 <- subset(distance, tau_flag == "tau0.9")

p3 <- ggplot(distance1, aes(x = rd, y = residuals)) +
 geom_point() +
 geom_hline(yintercept = cutoff_h[3], colour = "red") +
 geom_vline(xintercept = cutoff_v, colour = "red") +
 geom_text(data = subset(distance1, residuals > cutoff_h[3]|rd > cutoff_v),
         aes(label = case), hjust = 0, vjust = 0) +
xlab("Robust Distance") +
 ylab("|Residuals|")
grid.arrange(p1, p2, p3, ncol = 3)




