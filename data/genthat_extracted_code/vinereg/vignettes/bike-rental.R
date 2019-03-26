## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warning = FALSE, message = FALSE)

## ------------------------------------------------------------------------
set.seed(5)  # jittering is random

## ---- message = FALSE----------------------------------------------------
library(vinereg)
library(quantreg)
library(ggplot2)
library(dplyr)
library(purrr)
library(scales)

## ------------------------------------------------------------------------
plot_marginal_effects <- function(covs, preds) {
    cbind(covs, preds) %>%
        tidyr::gather(alpha, prediction, -seq_len(NCOL(covs))) %>%
        dplyr::mutate(prediction = as.numeric(prediction)) %>%
        tidyr::gather(variable, value, -(alpha:prediction)) %>%
        dplyr::mutate(value = as.numeric(value)) %>%
        ggplot(aes(value, prediction, color = alpha)) +
        geom_point(alpha = 0.15) + 
        geom_smooth(span = 0.5, se = FALSE) + 
        facet_wrap(~ variable, scale = "free_x") +
        theme(legend.position = "none") +
        theme(plot.margin = unit(c(0, 0, 0, 0), "mm")) +
        xlab("")
}

## ------------------------------------------------------------------------
bikedata <- read.csv("day.csv")
bikedata[, 2] <- as.Date(bikedata[, 2])
head(bikedata)

## ------------------------------------------------------------------------
bikedata  <- bikedata %>%
    rename(
        temperature = atemp, 
        month = mnth,
        weathersituation = weathersit,
        humidity = hum,
        count = cnt
    )

## ------------------------------------------------------------------------
bikedata <- bikedata %>%
    mutate(
        temperature = 66 * temperature + 16,
        windspeed = 67 * windspeed,
        humidity = 100 * humidity
    )

## ----count_with_trend----------------------------------------------------
ggplot(bikedata, aes(dteday, count)) +
    geom_line() + 
    scale_x_date(labels = scales::date_format("%b %y")) + 
    xlab("date") + 
    ylab("rental count") + 
    stat_smooth(method = "lm", se = FALSE, linetype = "dashed") + 
    theme(plot.title = element_text(lineheight = 0.8, face = "bold", size = 20)) +
    theme(text = element_text(size = 18))

## ----count_detrended-----------------------------------------------------
lm_trend <- lm(count ~ instant, data = bikedata)
trend <- predict(lm_trend)
bikedata <- mutate(bikedata, count = count / trend)
ggplot(bikedata, aes(dteday, count)) + 
    geom_line() + 
    scale_x_date(labels = scales::date_format("%b %y")) + 
    xlab("date") + 
    ylab("detrended rental count") + 
    theme(plot.title = element_text(lineheight = 0.8, face = "bold", size = 20)) + 
    theme(text = element_text(size = 18))

## ------------------------------------------------------------------------
bikedata <- bikedata %>%
    select(-instant, -dteday, -yr) %>%  # time indices
    select(-casual, -registered) %>%    # casual + registered = count
    select(-holiday) %>%                # we use 'workingday' instead
    select(-temp)                       # we use 'temperature' (feeling temperature)

## ------------------------------------------------------------------------
disc_vars <- c("season", "month", "weekday", "workingday", "weathersituation")
bikedata <- bikedata %>%
    mutate(weekday = ifelse(weekday == 0, 7, weekday)) %>%  # sun at end of week
    purrr::modify_at(disc_vars, as.ordered)

## ------------------------------------------------------------------------
npdvqr_fit <- vinereg(count ~ ., data = bikedata, family_set = "nonpar", selcrit = "aic")
colnames(bikedata)[npdvqr_fit$selected_vars]

## ------------------------------------------------------------------------
alpha_vec <- c(0.1, 0.5, 0.9)
npdvqr_pred <- fitted(npdvqr_fit, alpha_vec)

## ----me_temperature, fig.width=4, fig.height=4---------------------------
plot_marginal_effects(
    covs = select(bikedata, temperature), 
    preds = npdvqr_pred
)

## ----me_humidity, fig.width=4, fig.height=4, message=FALSE---------------
plot_marginal_effects(covs = select(bikedata, humidity), preds = npdvqr_pred) +
    xlim(c(25, 100))

## ----me_windspeed, fig.width=4, fig.height=4, message=FALSE--------------
plot_marginal_effects(covs = select(bikedata, windspeed), preds = npdvqr_pred) 

## ----me_month, fig.width=4, fig.height=4, message=FALSE------------------
month_labs <- c("Jan","", "Mar", "", "May", "", "Jul", "", "Sep", "", "Nov", "")
plot_marginal_effects(covs = select(bikedata, month), preds = npdvqr_pred) +
        scale_x_discrete(limits = 1:12, labels = month_labs)


## ----me_weathersituation, fig.width=4, fig.height=4, message=FALSE-------
plot_marginal_effects(covs = select(bikedata, weathersituation), 
                      preds = npdvqr_pred) +
    scale_x_discrete(limits = 1:3,labels = c("good", "medium", "bad"))

## ----me_weekday, fig.width=4, fig.height=4, message=FALSE----------------
weekday_labs <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
plot_marginal_effects(covs = select(bikedata, weekday), preds = npdvqr_pred) +
    scale_x_discrete(limits = 1:7, labels = weekday_labs)

## ----me_workingday, fig.width=4, fig.height=4, message=FALSE-------------
plot_marginal_effects(covs = select(bikedata, workingday), preds = npdvqr_pred) +
    scale_x_discrete(limits = 0:1, labels = c("no", "yes")) +
    geom_smooth(method = "lm", se = FALSE) +
    xlim(c(0, 1))

## ----me_season, fig.width=4, fig.height=4, message=FALSE-----------------
season_labs <- c("spring", "summer", "fall", "winter")
plot_marginal_effects(covs = select(bikedata, season), preds = npdvqr_pred) +
    scale_x_discrete(limits = 1:4, labels = season_labs)

