## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 4,
  fig.height = 4
)

## ------------------------------------------------------------------------
library(ssdtools)
library(readr)
library(ggplot2)
library(tidyr)
library(dplyr)
library(purrr)

## ---- eval = FALSE-------------------------------------------------------
#  data <- read_csv(file = "path/to/file.csv")

## ------------------------------------------------------------------------
data <- ssdtools::boron_data
print(data)

## ------------------------------------------------------------------------
dists <- ssd_fit_dists(data, dists = c("lnorm", "gompertz"))

## ------------------------------------------------------------------------
coef(dists)

## ---- fig.width = 5------------------------------------------------------
theme_set(theme_bw()) # set plot theme
gp <- autoplot(dists) 
gp <- gp + ggtitle("Species Sensitivity Distributions for Boron")
print(gp)

## ------------------------------------------------------------------------
boron_dists <- ssd_fit_dists(boron_data)
ssd_gof(boron_dists)

## ---- eval = FALSE-------------------------------------------------------
#  boron_pred <- predict(boron_dists)

## ------------------------------------------------------------------------
boron_pred

## ---- fig.height = 5, fig.width = 6--------------------------------------
gp <- ssd_plot(boron_data, boron_pred, color = "Group", label = "Species",
         xlab = "Concentration (mg/L)", ribbon = TRUE)
gp <- gp + expand_limits(x = 5000) + # to ensure the species labels fit
  scale_color_manual(values = c("Amphibian" = "Black", "Fish" = "Blue", 
                                "Invertebrate" = "Red", "Plant" = "Brown")) +
  ggtitle("Species Sensitivity for Boron")
print(gp)

## ------------------------------------------------------------------------
boron_pred[boron_pred$percent == 5,]

## ---- eval = FALSE-------------------------------------------------------
#  boron_hc5 <- ssd_hc(boron_dists, nboot = 10000)

## ------------------------------------------------------------------------
print(boron_hc5)

## ------------------------------------------------------------------------
ggplot(boron_data) + 
  geom_ssd(aes_string(x = "Conc"))

## ------------------------------------------------------------------------
ggplot(boron_pred) + 
  geom_xribbon(aes_string(xmin = "lcl", xmax = "ucl", y = "percent/100"))

## ------------------------------------------------------------------------
ggplot() + 
  geom_hcintersect(xintercept = c(1,2,3), yintercept = c(5,10,20)/100) 

## ------------------------------------------------------------------------
gp <- ggplot(boron_pred, aes_string(x = "est")) + 
  geom_xribbon(aes_string(xmin = "lcl", xmax = "ucl", y = "percent/100"), alpha = 0.2) +
  geom_line(aes_string(y = "percent/100")) +
  geom_ssd(data = boron_data, aes_string(x = "Conc")) +
  scale_y_continuous("Species Affected (%)", labels = scales::percent) +
  expand_limits(y = c(0, 1)) +
  xlab("Concentration (mg/L)")
print(gp + geom_hcintersect(xintercept = boron_hc5$est, yintercept = 5/100))

## ------------------------------------------------------------------------
gp <- gp + coord_trans(x = "log10") +
  scale_x_continuous(breaks = scales::trans_breaks("log10", function(x) 10^x),
                     labels = comma_signif)
print(gp + geom_hcintersect(xintercept = boron_hc5$est, yintercept = 5/100))

## ------------------------------------------------------------------------
boron_datas <- nest(boron_data, -Group)
boron_datas <- mutate(boron_datas, 
                      Fit = map(data, ssd_fit_dists, dists = "lnorm"), 
                      Prediction = map(Fit, predict))
boron_datas <- unnest(boron_datas, Prediction)

## ---- fig.width = 5, fig.height = 5--------------------------------------
boron_hc5s <- filter(boron_datas, percent == 5)
gp %+% boron_datas + 
  facet_wrap(~Group) + 
  geom_hcintersect(data = boron_hc5s, aes(xintercept = est, yintercept = percent/100))

## ---- fig.width = 5, fig.height = 5--------------------------------------
library(ssdtools)
ssd_cfplot(boron_data)

## ---- fig.width=6, fig.height=6, fig.show='hold'-------------------------
plot(dists)

## ---- error = TRUE-------------------------------------------------------
boron_data$Weight <- as.integer(boron_data$Group)
fit <- ssd_fit_dists(boron_data, weight = "Weight", dists = c("lnorm", "weibull"))
fit
plot(fit)

## ------------------------------------------------------------------------
data(fluazinam, package = "fitdistrplus")
head(fluazinam)

## ------------------------------------------------------------------------
fluazinam_dists <- ssd_fit_dists(fluazinam, left = "left", right = "right")
ssd_gof(fluazinam_dists)

## ---- eval = FALSE-------------------------------------------------------
#  fluazinam_pred <- predict(fluazinam_dists)

## ------------------------------------------------------------------------
ssd_plot(fluazinam, fluazinam_pred, 
         left = "left", right = "right", 
         xlab = "Concentration (mg/L)")

