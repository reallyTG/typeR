library(quokar)


### Name: frame_mle
### Title: General Cook's distance or Q-function distance of quantile
###   regression
### Aliases: frame_mle

### ** Examples

library(ggplot2)
data(ais)
ais_female <- subset(ais, Sex == 1)
y <- ais_female$BMI
x <- cbind(1, ais_female$LBM, ais_female$Bfat)
tau <- c(0.1, 0.5, 0.9)
case <- rep(1:length(y), length(tau))
GCD <- frame_mle(y, x, tau, error = 1e-06, iter = 10000,
                 method = 'cook.distance')
GCD_m <- cbind(case, GCD)
ggplot(GCD_m, aes(x = case, y = value )) +
  geom_point() +
  facet_wrap(~variable, scale = 'free') +
  geom_text(data = subset(GCD_m, value > mean(value) + 2*sd(value)),
            aes(label = case), hjust = 0, vjust = 0) +
  xlab("case number") +
  ylab("Generalized Cook Distance")

QD <- frame_mle(y, x, tau, error = 1e-06, iter = 10000,
                method = 'qfunction')
QD_m <- cbind(case, QD)
ggplot(QD_m, aes(x = case, y = value)) +
  geom_point() +
  facet_wrap(~variable, scale = 'free')+
  geom_text(data = subset(QD_m, value > mean(value) + sd(value)),
            aes(label = case), hjust = 0, vjust = 0) +
  xlab('case number') +
  ylab('Qfunction Distance')




