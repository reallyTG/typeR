## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.width=7, 
  fig.height=5 
)

## ----example-------------------------------------------------------------
library(outbreaks)
library(incidence)
dat <- ebola_sim$linelist$date_of_onset
i_14 <- incidence(dat, interval = 14, groups = ebola_sim$linelist$gender)
i_14
plot(i_14, border = "white")

## ------------------------------------------------------------------------
as.data.frame(i_14)

## ---- long---------------------------------------------------------------
df <- as.data.frame(i_14, long = TRUE)
head(df)
tail(df)

## example of custom plot using steps:
library(ggplot2)
ggplot(df, aes(x = dates, y = counts)) + geom_step(aes(color = groups))

## ---- iso----------------------------------------------------------------
i_7 <- incidence(dat, interval = 7)
i_7
plot(i_7, border = "white")
head(as.data.frame(i_7))
tail(as.data.frame(i_7))


## ---- conversions--------------------------------------------------------
args(incidence:::as.incidence.matrix)

## ------------------------------------------------------------------------
vec <- c(1,2,3,0,3,2,4,1,2,1)

i <- as.incidence(vec)
i

plot(vec, type = "s")
plot(i, border = "white")


## ------------------------------------------------------------------------
i <- as.incidence(vec, interval = 7)
i
plot(i, border = "white")


## ------------------------------------------------------------------------
i$dates

## ---- round_trip---------------------------------------------------------
## convertion: incidence --> data.frame:
i_14
df <- as.data.frame(i_14)
head(df)
tail(df)

## conversion: data.frame --> incidence
new_i <- as.incidence(df[,-1], df$dates)
new_i

## check round trip
identical(new_i, i_14)


