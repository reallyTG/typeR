## ----load_libraries------------------------------------------------------
library(ggplot2)
library(magrittr)
library(tidyr)
library(dplyr)

library(ggfan)


## ----simulate_data-------------------------------------------------------
# generate mean and variance for sequence of samples over time
N_time <- 50
N_sims <- 1000 
time <- 1:N_time
mu <- time**2 * 0.03 + time * 0.3
sds <- exp(time**2 * -0.001 + time * 0.1)

# simulate 1000 samples from each time point
fake_data <- sapply(time, function(i) rnorm(N_sims, mu[i], sds[i]))

# gather into a long-form, tidy dataset
fake_df <- data.frame(x=time, t(fake_data)) %>% gather(key=Sim, value=y, -x)

head(fake_df)


## ----plot_stat_interval--------------------------------------------------
p <- ggplot(fake_df, aes(x=x,y=y)) + geom_interval()
print(p)
p + geom_interval(aes(colour=..Interval..), intervals=c(0,0.5,0.9,0.99))

## ----plot_geom_fan-------------------------------------------------------

p <- ggplot(fake_df, aes(x=x,y=y)) + geom_fan()
print(p)

## ----both_layers---------------------------------------------------------
ggplot(fake_df, aes(x=x, y= y)) + geom_fan() + geom_interval() + 
  scale_linetype_manual(values=c("solid", "dashed", "dotted"))


## ----check_theoretical---------------------------------------------------
quants <- c(2.5,10,25,50,75,90,97.5) 
q_df <- as.data.frame(sapply(quants*0.01, qnorm, mu, sds))

names(q_df) <-  gsub("^","q", quants)
q_df <- cbind(q_df,time)
q_df <-gather(q_df,key=quantile, value=value, -time)

p + geom_line(data=q_df, mapping=aes(x=time,y=value, group=quantile, linetype=quantile))


## ----stat_sample---------------------------------------------------------
set.seed(53)
ggplot(fake_df, aes(x=x,y=y)) + geom_fan() + 
  stat_sample(aes(group=Sim), n_samples=7, size=0.2, alpha=1)


## ----quantiles_direct----------------------------------------------------

fake_q <-  fake_df %>% calc_quantiles(intervals=(1:99)/100) 

names(fake_q)
dim(fake_df); dim(fake_q)

ggplot(fake_q,  aes(x=x,y=y,quantile=quantile)) + geom_fan()



## ----plot_geom_fan_bw----------------------------------------------------

ggplot(fake_df, aes(x=x,y=y)) + geom_fan() + theme_bw()


## ----spectral------------------------------------------------------------
ggplot(fake_df, aes(x=x,y=y)) + geom_fan() + theme_bw() + scale_fill_distiller(palette="Spectral")

ggplot(fake_df, aes(x=x,y=y)) + geom_fan() + theme_bw() + scale_fill_gradient(low="red", high="pink")


## ----probs---------------------------------------------------------------

ggplot(fake_df, aes(x=x, y=y)) + geom_fan(intervals=c(50,80,95)/100) +
  theme_bw() + geom_line(data=q_df, mapping=aes(x=time,y=value, group=quantile, linetype=quantile))


## ----facet---------------------------------------------------------------

fake_df_sex <- fake_df %>% mutate(y=-fake_df$y, Sex="Male")

fake_df_sex <- rbind(fake_df %>% mutate(Sex="Female"), fake_df_sex)

ggplot(fake_df_sex, aes(x=x,y=y)) + geom_fan() + theme_bw() + scale_fill_gradientn(colours = terrain.colors(10)) + facet_wrap(~Sex)


## ----stat_interval_group-------------------------------------------------

p <- ggplot(fake_df_sex, aes(x=x, y=y,group=Sex,colour=Sex)) + geom_interval() + theme_bw()
print(p)

## ----geom_fan_group------------------------------------------------------

p <- ggplot(fake_df_sex, aes(x=x, y=y,group=Sex)) + geom_fan() +theme_bw()
print(p)


