## ----setup---------------------------------------------------------------
library(rstan)
library(dplyr)
library(magrittr)
library(tidyr)
library(tibble)

library(ggfan)


## ----stan_example--------------------------------------------------------
seed <- 34526
set.seed(seed)

# data 
x <- seq(-5,5,0.1)
N <- length(x)
y <- cbind(rpois(N, exp(sin(x)+2)),rpois(N, exp(sin(x)+2)))

stan_data <- list(N=N, x=x, y=y)

plot(x,y[,1])
points(x,y[,2])

## ----fit_model, results=FALSE, echo=TRUE, eval=FALSE---------------------
#  gp_model_fit <- sampling(compiled_model, data=stan_data, iter=3000,thin=6)

## ----rhat----------------------------------------------------------------
stan_rhat(gp_model_fit)

## ----convert_to_list-----------------------------------------------------

z_df <- as_tibble(t(as.matrix(gp_model_fit, "z")))
z_df <- z_df %>% mutate(x=x)

z_df_long <- z_df %>% gather(key=Sim, value=z, -x)

ggplot(z_df_long, aes(x=x,y=z)) + geom_fan() + geom_line(data=data.frame(x=x,y=sin(x)+2), aes(x=x,y=y),colour="red") + theme_minimal() + 
  scale_fill_distiller()

## ----observations--------------------------------------------------------
y_df <- as_tibble(t(as.matrix(gp_model_fit, "y_gen")))
y_df <- y_df %>% mutate(x=x)

y_df_long <- y_df %>% gather(key=Sim, value=y, -x)

obs_data <- data.frame(x=rep(x,2), y=c(y[,1], y[,2]))
ggplot(y_df_long, aes(x=x,y=y)) + geom_fan() + 
  geom_point(data=obs_data, aes(x=x,y=y)) + theme_minimal() + 
  scale_fill_distiller() + geom_interval()


