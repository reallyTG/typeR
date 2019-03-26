## ----echo = FALSE--------------------------------------------------------
library(ggplot2)
library(knitr)
opts_chunk$set(comment=NA, fig.width=7.2)


## ------------------------------------------------------------------------
library(ggseas)
ap_df <- tsdf(AirPassengers)
head(ap_df)

## ------------------------------------------------------------------------
ggplot(ap_df, aes(x = x, y = y)) + 
   geom_line(colour = "grey75") 

## ------------------------------------------------------------------------
ggplot(ap_df, aes(x = x, y = y)) + 
   stat_index(index.ref = 1:10)

## ------------------------------------------------------------------------
ggplot(ap_df, aes(x = x, y = y)) + 
   stat_index(index.ref = 120, index.basis = 1000)

## ------------------------------------------------------------------------
ggplot(ap_df, aes(x = x, y = y)) + 
   geom_line(colour = "grey75") +
   stat_rollapplyr(width = 12, align = "center") +
   labs(x = "", y = "Number of US Air Passengers\n(rolling average and original)")

## ------------------------------------------------------------------------
ggplot(ap_df, aes(x = x, y = y)) + 
   geom_line(colour = "grey75") +
   stat_rollapplyr(width = 12, align = "center", geom = "point", 
                   size = 0.5, colour = "steelblue") +
   labs(x = "", y = "Number of US Air Passengers\n(rolling average and original)")

## ------------------------------------------------------------------------
ggplot(ap_df, aes(x = x, y = y)) +
   geom_line(colour = "grey50") +
   stat_seas(colour = "blue") +
   stat_stl(s.window = 7, colour = "red")

## ------------------------------------------------------------------------
ggplot(ldeaths_df, aes(x = YearMon, y = deaths, colour = sex)) +
  geom_point() +
  facet_wrap(~sex) +
  stat_seas() +
  ggtitle("Seasonally adjusted lung deaths in the UK")

## ----fig.height = 5------------------------------------------------------
ggsdc(ap_df, aes(x = x, y = y), method = "seas") + geom_line()

## ----fig.height = 6------------------------------------------------------
serv <- subset(nzbop, Account == "Current account" & 
                  Category %in% c("Services; Exports total", "Services; Imports total"))
ggsdc(serv, aes(x = TimePeriod, y = Value, colour = Category),
         method = "stl", s.window = 7, frequency = 4,
         facet.titles = c("The original series", "The underlying trend", 
                          "Regular seasonal patterns", "All the randomness left")) +
      geom_line()

