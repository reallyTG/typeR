library(baystability)


### Name: bayes_ammi
### Title: Bayesian Estimation of Genotype by Environment Interaction Model
### Aliases: bayes_ammi bayes_ammi.default

### ** Examples


data(cultivo2008)
fm1 <-
   ge_ammi(
      .data  = cultivo2008
     , .y    = y
     , .gen  = entry
     , .env  = site
     , .rep  = rep
     )

r0 <- fm1$g
c0 <- fm1$e
n0 <- fm1$Rep
k0 <- fm1$k

mu0      <- fm1$mu
sigma20  <- fm1$sigma2
tau0     <- fm1$tau
tao0     <- fm1$tao
delta0   <- fm1$delta
lambdas0 <- fm1$lambdas
alphas0  <- fm1$alphas
gammas0  <- fm1$gammas

ge_means0 <- fm1$ge_means$ge_means

data(cultivo2008)

fm2 <-
 ge_ammi(
   .data = cultivo2009
   , .y    = y
   , .gen  = entry
   , .env  = site
   , .rep  = rep
  )

k        <- fm2$k
alphasa  <- fm2$alphas
gammasa  <- fm2$gammas

alphas1  <- tibble::as_tibble(fm2$alphas)
gammas1  <- tibble::as_tibble(fm2$gammas)



# Biplots OLS
library(ggplot2)
    BiplotOLS1 <-
      ggplot(data = alphas1, mapping = aes(x = V1, y = V2)) +
      geom_point() +
      geom_hline(yintercept = 0) +
      geom_vline(xintercept = 0) +
      geom_text(aes(label = 1:nrow(alphas1)), vjust = "inward", hjust = "inward") +
      scale_x_continuous(
               limits = c(-max(abs(c(range(alphas1[, 1:2]))))
                         , max(abs(c(range(alphas1[, 1:2])))))) +
      scale_y_continuous(
               limits = c(-max(abs(c(range(alphas1[, 1:2]))))
                         , max(abs(c(range(alphas1[, 1:2])))))) +
      labs(title = "OLS", x = expression(u[1]), y = expression(u[2])) +
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
      print(BiplotOLS1)


    BiplotOLS2 <-
      ggplot(data = gammas1, mapping = aes(x = V1, y = V2)) +
      geom_point() +
      geom_hline(yintercept = 0) +
      geom_vline(xintercept = 0) +
      geom_text(aes(label = 1:nrow(gammas1)), vjust = "inward", hjust = "inward") +
      scale_x_continuous(
                limits = c(-max(abs(c(range(gammas1[, 1:2]))))
                         , max(abs(c(range(gammas1[, 1:2])))))) +
      scale_y_continuous(
                limits = c(-max(abs(c(range(gammas1[, 1:2]))))
                          , max(abs(c(range(gammas1[, 1:2])))))) +
      labs(title = "OLS", x = expression(v[1]), y = expression(v[2])) +
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
      print(BiplotOLS2)


    BiplotOLS3 <-
      ggplot(data = alphas1, mapping = aes(x = V1, y = V2)) +
      geom_point() +
      geom_hline(yintercept = 0) +
      geom_vline(xintercept = 0) +
      geom_text(aes(label = 1:nrow(alphas1)), vjust = "inward", hjust = "inward") +
      geom_point(data = gammas1, mapping = aes(x = V1, y = V2)) +
      geom_segment(data = gammas1, aes(x = 0, y = 0, xend = V1, yend = V2),
                    arrow = arrow(length = unit(0.2, "cm")), alpha = 0.75, color = "red") +
      geom_text(data = gammas1,
              aes(x = V1, y = V2, label = paste0("E", 1:nrow(gammasa)))
             , vjust = "inward", hjust = "inward") +
      scale_x_continuous(
              limits = c(-max(abs(c(range(alphas1[, 1:2], gammas1[, 1:2]))))
                        , max(abs(c(range(alphas1[, 1:2], gammas1[, 1:2])))))) +
      scale_y_continuous(
              limits = c(-max(abs(c(range(alphas1[, 1:2], gammas1[, 1:2]))))
                       , max(abs(c(range(alphas1[, 1:2], gammas1[, 1:2])))))) +
      labs(title = "OLS", x = expression(PC[1]), y = expression(PC[2])) +
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
      print(BiplotOLS3)


fm3 <-
  bayes_ammi(
    .data = cultivo2009
    , .y     = y
    , .gen   = entry
    , .env   = site
    , .rep   = rep
    , .nIter = 200
  )


Mean_Alphas <- tibble::as_tibble(matrix(colMeans(fm3$alphas1), ncol = 11))
Mean_Gammas <- tibble::as_tibble(matrix(colMeans(fm3$gammas1), ncol = 11))

# Biplots Bayesian
BiplotBayes1 <-
  ggplot(data = Mean_Alphas, mapping = aes(x = V1, y = V2)) +
  geom_point() +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 0) +
  geom_text(aes(label = 1:nrow(Mean_Alphas)),
             vjust = "inward"
           , hjust = "inward") +
  scale_x_continuous(
     limits = c(-max(abs(c(range(Mean_Alphas[, 1:2]))))
               , max(abs(c(range(Mean_Alphas[, 1:2])))))) +
  scale_y_continuous(
      limits = c(-max(abs(c(range(Mean_Alphas[, 1:2]))))
                , max(abs(c(range(Mean_Alphas[, 1:2])))))) +
  labs(title = "Bayes", x = expression(u[1]), y = expression(u[2])) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

print(BiplotBayes1)


BiplotBayes2 <-
  ggplot(data = Mean_Gammas, mapping = aes(x = V1, y = V2)) +
  geom_point() +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 0) +
  geom_text(aes(label = 1:nrow(Mean_Gammas)), vjust = "inward", hjust = "inward") +
  scale_x_continuous(
            limits = c(-max(abs(c(range(Mean_Gammas[, 1:2]))))
                      , max(abs(c(range(Mean_Gammas[, 1:2])))))) +
  scale_y_continuous(
            limits = c(-max(abs(c(range(Mean_Gammas[, 1:2]))))
                      , max(abs(c(range(Mean_Gammas[, 1:2])))))) +
  labs(title = "Bayes", x = expression(v[1]), y = expression(v[2])) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

print(BiplotBayes2)


BiplotBayes3 <-
  ggplot(data = Mean_Alphas, mapping = aes(x = V1, y = V2)) +
  geom_point() +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 0) +
  geom_text(aes(label = 1:nrow(Mean_Alphas)),
             vjust = "inward", hjust = "inward") +
  geom_point(data = Mean_Gammas, mapping = aes(x = V1, y = V2)) +
  geom_segment(data = Mean_Gammas,
                aes(x = 0, y = 0, xend = V1, yend = V2),
               arrow = arrow(length = unit(0.2, "cm"))
               , alpha = 0.75, color = "red") +
  geom_text(data = Mean_Gammas,
            aes(x = V1, y = V2,
            label = paste0("E", 1:nrow(Mean_Gammas))),
            vjust = "inward", hjust = "inward") +
  scale_x_continuous(
            limits = c(-max(abs(c(range(Mean_Alphas[, 1:2], Mean_Gammas[, 1:2]))))
                      , max(abs(c(range(Mean_Alphas[, 1:2], Mean_Gammas[, 1:2])))))) +
  scale_y_continuous(
           limits = c(-max(abs(c(range(Mean_Alphas[, 1:2], Mean_Gammas[, 1:2]))))
                   , max(abs(c(range(Mean_Alphas[, 1:2], Mean_Gammas[, 1:2])))))) +
  labs(title = "Bayes", x = expression(PC[1]), y = expression(PC[2])) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

print(BiplotBayes3)



