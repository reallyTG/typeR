library(bayesammi)


### Name: bayes_ammi
### Title: Bayesian Estimation of the Additive Main Effects and
###   Multiplicative Interaction Model
### Aliases: bayes_ammi bayes_ammi.default

### ** Examples


data(Maiz)

fm1 <-
 bayes_ammi(
     .data  = Maiz
   , .y     = y
   , .gen   = entry
   , .env   = site
   , .rep   = rep
   , .nIter = 20
  )
names(fm1)
fm1$mu1
fm1$tau1
fm1$tao1
fm1$delta1
fm1$lambdas1
fm1$alphas1
fm1$gammas1

library(ggplot2)

Plot1Mu <-
  ggplot(data = fm1$mu1, mapping = aes(x = 1:nrow(fm1$mu1), y = mu)) +
  geom_line(color = "blue") +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = expression(mu), x = "Iterations") +
  theme_bw()
print(Plot1Mu)

Plot2Mu <-
  ggplot(data = fm1$mu1, mapping = aes(mu)) +
  geom_histogram() +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = "Frequency", x = expression(mu)) +
  theme_bw()
print(Plot2Mu)


Plot1Sigma2 <-
  ggplot(data = fm1$tau1, mapping = aes(x = 1:nrow(fm1$tau1), y = tau)) +
  geom_line(color = "blue") +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = expression(sigma^2), x = "Iterations") +
  theme_bw()
print(Plot1Sigma2)


Plot2Sigma2 <-
  ggplot(data = fm1$tau1, mapping = aes(tau)) +
  geom_histogram() +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = "Frequency", x = expression(sigma^2)) +
  theme_bw()
print(Plot2Sigma2)


# Plot of Alphas
Plot1Alpha1 <-
  ggplot(data = fm1$tao1, mapping = aes(x = 1:nrow(fm1$tao1), y = tao1)) +
  geom_line(color = "blue") +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = expression(alpha[1]), x = "Iterations") +
  theme_bw()
print(Plot1Alpha1)

Plot2Alpha1 <-
  ggplot(data = fm1$tao1, mapping = aes(tao1)) +
  geom_histogram() +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = "Frequency", x = expression(alpha[1])) +
  theme_bw()
print(Plot2Alpha1)

Plot1Alpha2 <-
  ggplot(data = fm1$tao1, mapping = aes(x = 1:nrow(fm1$tao1), y = tao2)) +
  geom_line(color = "blue") +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = expression(alpha[2]), x = "Iterations") +
  theme_bw()
print(Plot1Alpha2)

Plot2Alpha2 <-
  ggplot(data = fm1$tao1, mapping = aes(tao2)) +
  geom_histogram() +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = "Frequency", x = expression(alpha[2])) +
  theme_bw()
print(Plot2Alpha2)

# Plot of Betas
Plot1Beta1 <-
  ggplot(data = fm1$delta1, mapping = aes(x = 1:nrow(fm1$delta1), y = delta1)) +
  geom_line(color = "blue") +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = expression(beta[1]), x = "Iterations") +
  theme_bw()
print(Plot1Beta1)

Plot2Beta1 <-
  ggplot(data = fm1$delta1, mapping = aes(delta1)) +
  geom_histogram() +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = "Frequency", x = expression(beta[1])) +
  theme_bw()
print(Plot2Beta1)


Plot1Beta2 <-
  ggplot(data = fm1$delta1, mapping = aes(x = 1:nrow(fm1$delta1), y = delta2)) +
  geom_line(color = "blue") +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = expression(beta[2]), x = "Iterations") +
  theme_bw()
print(Plot1Beta2)

Plot2Beta2 <-
  ggplot(data = fm1$delta1, mapping = aes(delta2)) +
  geom_histogram() +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = "Frequency", x = expression(beta[2])) +
  theme_bw()
print(Plot2Beta2)


Plot1Beta3 <-
  ggplot(data = fm1$delta1, mapping = aes(x = 1:nrow(fm1$delta1), y = delta3)) +
  geom_line(color = "blue") +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = expression(beta[3]), x = "Iterations") +
  theme_bw()
print(Plot1Beta3)

Plot2Beta3 <-
  ggplot(data = fm1$delta1, mapping = aes(delta3)) +
  geom_histogram() +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  labs(y = "Frequency", x = expression(beta[3])) +
  theme_bw()
print(Plot2Beta3)


BiplotAMMI <-
  ggplot(data = fm1$alphas0, mapping = aes(x = alphas1, y = alphas2)) +
  geom_point() +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 0) +
  geom_text(aes(label = 1:nrow(fm1$alphas0)),
            vjust = "inward", hjust = "inward") +
  geom_point(data = fm1$gammas0, mapping = aes(x = gammas1, y = gammas2)) +
  geom_segment(data = fm1$gammas0,
               aes(x = 0, y = 0, xend = gammas1, yend = gammas2),
               arrow = arrow(length = unit(0.2, "cm"))
               , alpha = 0.75, color = "red") +
  geom_text(data = fm1$gammas0,
            aes(x = gammas1, y = gammas2,
                label = paste0("E", 1:nrow(fm1$gammas0))),
            vjust = "inward", hjust = "inward") +
  scale_x_continuous(
    limits = c(-max(abs(c(range(fm1$alphas0[, 1:2], fm1$gammas0[, 1:2]))))
               , max(abs(c(range(fm1$alphas0[, 1:2], fm1$gammas0[, 1:2])))))) +
  scale_y_continuous(
    limits = c(-max(abs(c(range(fm1$alphas0[, 1:2], fm1$gammas0[, 1:2]))))
               , max(abs(c(range(fm1$alphas0[, 1:2], fm1$gammas0[, 1:2])))))) +
  labs(title = "MCO Method", x = expression(PC[1]), y = expression(PC[2])) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

print(BiplotAMMI)


BiplotBayesAMMI <-
  ggplot(data = fm1$alphas1, mapping = aes(x = alphas1, y = alphas2)) +
  geom_point() +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 0) +
  geom_text(aes(label = 1:nrow(fm1$alphas1)),
            vjust = "inward", hjust = "inward") +
  geom_point(data = fm1$gammas1, mapping = aes(x = gammas1, y = gammas2)) +
  geom_segment(data = fm1$gammas1,
               aes(x = 0, y = 0, xend = gammas1, yend = gammas2),
               arrow = arrow(length = unit(0.2, "cm"))
               , alpha = 0.75, color = "red") +
  geom_text(data = fm1$gammas1,
            aes(x = gammas1, y = gammas2,
                label = paste0("E", 1:nrow(fm1$gammas1))),
            vjust = "inward", hjust = "inward") +
  scale_x_continuous(
    limits = c(-max(abs(c(range(fm1$alphas1[, 1:2], fm1$gammas1[, 1:2]))))
               , max(abs(c(range(fm1$alphas1[, 1:2], fm1$gammas1[, 1:2])))))) +
  scale_y_continuous(
    limits = c(-max(abs(c(range(fm1$alphas1[, 1:2], fm1$gammas1[, 1:2]))))
               , max(abs(c(range(fm1$alphas1[, 1:2], fm1$gammas1[, 1:2])))))) +
  labs(title = "Bayesian Method", x = expression(PC[1]), y = expression(PC[2])) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

print(BiplotBayesAMMI)





