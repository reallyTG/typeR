## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library("colorednoise")
library("dplyr")
library("ggplot2")
library("purrr")

## ----comparing red and blue noise, echo = F------------------------------
blue <- colored_noise(timesteps = 100, mean = 0.5, sd = 0.2, phi = -0.5)
red <- colored_noise(timesteps = 100, mean = 0.5, sd = 0.2, phi = 0.5)
ggplot(data = NULL, aes(x = c(1:100), y = blue)) + geom_line(color="blue") + theme_minimal() + theme(axis.title = element_blank()) + ggtitle("Blue Noise")
ggplot(data = NULL, aes(x = c(1:100), y = red)) + geom_line(color="red") + theme_minimal() + theme(axis.title = element_blank()) + ggtitle("Red Noise")

## ----generate noise------------------------------------------------------
red <- colored_noise(timesteps = 100, mean = 0.3, sd = 1.2, phi = 0.5)
red[1:10]
blue <- colored_noise(timesteps = 100, mean = 0.3, sd = 1.2, phi = -0.5)
blue[1:10]
ggplot(data = NULL, aes(x = c(1:100), y = blue)) + geom_line(color="blue") + theme_minimal() + theme(axis.title = element_blank()) + ggtitle("Blue Noise")
ggplot(data = NULL, aes(x = c(1:100), y = red)) + geom_line(color="red") + theme_minimal() + theme(axis.title = element_blank()) + ggtitle("Red Noise")

## ----estimate noise------------------------------------------------------
invoke_map(list(mean, sd, autocorrelation), rep(list(list(red)), 3))
invoke_map(list(mean, sd, autocorrelation), rep(list(list(blue)), 3))

## ----generate replicates-------------------------------------------------
raw_sims <- cross_df(list(timesteps = 20, phi = c(-0.5, 0, 0.5), mean = 0.3, sd = c(0.5, 0.7, 0.9, 1.1, 1.3, 1.5))) %>% rerun(.n = 30, pmap(., colored_noise))
labels <- raw_sims %>% map(1) %>% bind_rows()
noise <- raw_sims %>% map(2) %>% flatten()
estimates <- data.frame(mu = map_dbl(noise, mean), sigma = map_dbl(noise, sd), autocorrelation = map_dbl(noise, autocorrelation))
sd_range <- cbind(labels, estimates)
head(sd_range)

## ----plot CIs------------------------------------------------------------
sd_range %>% group_by(phi, sd) %>% summarize_at(funs(lower.ci = ((function(bar){quantile(bar, probs=c(0.05, 0.95))[[1]]})(.)),
           upper.ci = ((function(bar){quantile(bar, probs=c(0.05, 0.95))[[2]]})(.)),
           mean = mean(.)), .vars = vars(autocorrelation)) -> summ
ggplot(summ, aes(x = sd, y = mean)) +
  geom_pointrange(aes(ymin = lower.ci, ymax = upper.ci, color = factor(phi)), size = 0.8) + 
  geom_hline(yintercept = 0, linetype = 2, color = "#C0C0C0") +
  geom_hline(yintercept = -0.5, linetype = 2, color = "#0033FF") +
  geom_hline(yintercept = 0.5, linetype = 2, color = "#CC0000") +
  theme(text=element_text(size=20)) + xlab("Standard Deviation") + ylab("Estimated Autocorrelation") + scale_colour_manual(values = c("#0033FF", "#C0C0C0", "#CC0000")) + labs(color="Noise color") + theme_light()

## ----model single population---------------------------------------------
set.seed(3935)
series1 <- unstructured_pop(start=20, timesteps=20, survPhi=0.4, fecundPhi=0.4, survMean=0.5, survSd=0.2, fecundMean=1, fecundSd=0.7)
ggplot(series1, aes(x=timestep, y=population)) + geom_line()

## ----simulate many populations-------------------------------------------
sims <- autocorr_sim(timesteps = seq(5, 60, 5), start = 200, survPhi = c(-0.5, -0.25, -0.2, -0.1, 0, 0.1, 0.2, 0.25, 0.5), fecundPhi = 0, survMean = 0.4, survSd = 0.05, fecundMean = 1.8, fecundSd = 0.2, replicates = 100)
ggplot(sims[[6]], aes(x=timestep, y=population)) + geom_line()

## ----estimate autocorrelation--------------------------------------------
sims %>% map(~group_by(., survPhi, timesteps)) %>% map(~summarize(., acf.surv = autocorrelation(est_surv, biasCorrection = F))) %>% bind_rows -> estimates

## ----plotting estimates, fig.height=5, fig.width=8-----------------------
estimates %>% group_by(survPhi, timesteps) %>% summarize_at(funs(lower.ci = ((function(bar){quantile(bar, probs=c(0.05, 0.95), na.rm = T)[[1]]})(.)),
           upper.ci = ((function(bar){quantile(bar, probs=c(0.05, 0.95), na.rm = T)[[2]]})(.)),
           mean = mean(., na.rm = T)), .vars = vars(acf.surv)) -> summ2
# Noise color values for the graph in hexadecimal
noise = c("#0033FF", "#3366FF", "#6699FF", "#99CCFF", "#FFFFFF", "#FF9999", "#FF6666","#FF0000", "#CC0000")
ggplot(summ2, aes(x=timesteps, y=mean)) + geom_point(size=8, aes(color=factor(survPhi))) +
# This creates confidence intervals around the autocorrelations  
geom_pointrange(aes(ymin=lower.ci, ymax=upper.ci), size=0.8) + 
  # Adds a line for the true autocorrelation value
  geom_hline(aes(yintercept=survPhi), linetype=2) +
# This facets the plots by true autocorrelation value  
facet_wrap( ~ survPhi) + 
# This increases the font size and labels everything nicely  
  theme(text=element_text(size=13)) + xlab("Time series lengths") + ylab("Estimated Autocorrelation") + scale_colour_manual(values=noise) + labs(color="Noise color") + ggtitle("Bias in estimates of autocorrelation of survival") + scale_y_continuous(limits=c(-1.1, 1.2))

## ----bias correction, message = F----------------------------------------
sims %>% map(~group_by(., survPhi, timesteps)) %>% map(~summarize(., acf.surv = autocorrelation(est_surv, biasCorrection = TRUE))) %>% bind_rows() %>% group_by(survPhi, timesteps) %>% summarize_at(funs(lower.ci = ((function(bar){quantile(bar, probs=c(0.05, 0.95), na.rm = T)[[1]]})(.)),
           upper.ci = ((function(bar){quantile(bar, probs=c(0.05, 0.95), na.rm = T)[[2]]})(.)),
           mean = mean(., na.rm = T)), .vars = vars(acf.surv)) -> summ3
ggplot(summ3, aes(x=timesteps, y=mean)) + 
  geom_point(size=8, aes(color=factor(survPhi))) +
  geom_pointrange(aes(ymin=lower.ci, ymax=upper.ci), size=0.8) + 
  geom_hline(aes(yintercept=survPhi), linetype=2) +
  facet_wrap( ~ survPhi) + 
  theme(text=element_text(size=13)) + xlab("Time series lengths") +
  ylab("Estimated Autocorrelation") + scale_colour_manual(values=noise) +
  labs(color="Noise color") + 
  ggtitle("Bias in estimates of autocorrelation of survival") +
  scale_y_continuous(limits=c(-1.1, 1.2))

