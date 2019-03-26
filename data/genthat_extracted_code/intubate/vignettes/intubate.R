## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.align = 'center',
                      fig.width = 4, fig.height = 4.5)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("intubate")

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("rbertolusso/intubate")

## ------------------------------------------------------------------------
fit <- lm(sr ~ pop15, LifeCycleSavings)
summary(fit)

## ------------------------------------------------------------------------
library(intubate)
library(magrittr)

## ------------------------------------------------------------------------
LifeCycleSavings %>%
  ntbt_lm(sr ~ pop15) %>%    ## ntbt_lm is the interface to lm provided by intubate
  summary()

## ------------------------------------------------------------------------
LifeCycleSavings %>%
  ntbt(lm, sr ~ pop15) %>%   ## ntbt calls lm without needing to use an interface
  summary()

## ---- results = 'hide'---------------------------------------------------
data(USJudgeRatings)

## 1)
cor.test(USJudgeRatings$CONT, USJudgeRatings$INTG)

## 2)
attach(USJudgeRatings)
cor.test(CONT, INTG)
detach()

## 3)
with(USJudgeRatings, cor.test(CONT, INTG))
     
## 4)
USJudgeRatings %>%
   with(cor.test(CONT, INTG))

## ------------------------------------------------------------------------
ntbt_cor.test <- intubate          ## intubate is the helper function

## ------------------------------------------------------------------------
USJudgeRatings %>%
  ntbt_cor.test(CONT, INTG)           ## Use it right away

## ------------------------------------------------------------------------
USJudgeRatings %>%
  ntbt(cor.test, CONT, INTG)

## ------------------------------------------------------------------------
attach(anscombe)
plot(x1, y1, xlim = c(4, 20), ylim = c(3, 14), main = "Data Set 1")
abline(lsfit(x1, y1))
detach()

## ------------------------------------------------------------------------
anscombe %>%
  ntbt_plot(x2, y2, xlim = c(4, 20), ylim = c(3, 14), main = "Data Set 2") %>%
  ntbt(lsfit, x2, y2) %>%   # Call non-pipe-aware function directly with `ntbt`
  abline()                  # No need to interface 'abline'.

## ------------------------------------------------------------------------
ntbt_lsfit <- intubate      # NOTE: we are *not* including parentheses.

## ------------------------------------------------------------------------
anscombe %>%
  ntbt_plot(x3, y3, xlim = c(4, 20), ylim = c(3, 14), main = "Data Set 3") %>%
  ntbt_lsfit(x3, y3) %>%    # Using just created "on demand" interface
  abline()

## ------------------------------------------------------------------------
anscombe %>%
  ntbt_plot(y4 ~ x4, xlim = c(4, 20), ylim = c(3, 14), main = "Data Set 4") %>%
  ntbt_lm(y4 ~ x4) %>%      # We use 'ntbt_lm' instead of 'ntbt_lmfit' 
  abline()

## ---- results = 'hide'---------------------------------------------------
head(LifeCycleSavings)
tail(LifeCycleSavings, n = 3)
dim(LifeCycleSavings)
str(LifeCycleSavings)
summary(LifeCycleSavings)
result <- lm(sr ~ pop15 + pop75 + dpi + ddpi, LifeCycleSavings)
print(result)
summary(result)
anova(result)
plot(result, which = 1)

## ------------------------------------------------------------------------
LifeCycleSavings %>%
  ntbt_lm(sr ~ pop15 + pop75 + dpi + ddpi,
          "< head; tail(#, n = 3); dim; str; summary
             |i|
             print; summary; anova; plot(#, which = 1) >")

## ---- results = 'hide'---------------------------------------------------
ntbt_lm(LifeCycleSavings, sr ~ pop15 + pop75 + dpi + ddpi,
        "< head; tail(#, n = 3); dim; str; summary
           |i|
           print; summary; anova; plot(#, which = 1) >")

## ---- results = 'hide'---------------------------------------------------
CO2 %>%
  ntbt_lm(conc ~ uptake)

USJudgeRatings %>%
  ntbt_cor.test(CONT, INTG)

sleep %>%
  ntbt_t.test(extra ~ group)

## ------------------------------------------------------------------------
coll <- list(CO3 = CO2,
             USJudgeRatings1 = USJudgeRatings,
             sleep1 = sleep)
names(coll)

## ------------------------------------------------------------------------
coll %>%
  ntbt_lm(conc ~ uptake, "CO3 <|f| print >") %>%
  ntbt_cor.test(CONT, INTG, "USJudgeRatings1 <|f| print >") %>%
  ntbt_t.test(extra ~ group, "sleep1 <|f| print >") %>%
  names()

## ------------------------------------------------------------------------
intuEnv()  ## intuEnv() returns invisible, so nothing is output

## ------------------------------------------------------------------------
ls(intuEnv())

## ------------------------------------------------------------------------
coll %>%
  ntbt_lm(conc ~ uptake, "CO3 <|f|> lmfit") %>%
  ntbt_cor.test(CONT, INTG, "USJudgeRatings1 <|f|> ctres") %>%
  ntbt_t.test(extra ~ group, "sleep1 <|f|> ttres") %>%
  names()

## ------------------------------------------------------------------------
ls(intuEnv())

## ---- results = 'hide'---------------------------------------------------
intuEnv()$lmfit %>%
  summary()

## ---- results = 'hide'---------------------------------------------------
attach(intuEnv())
lmfit %>%
  summary()
detach()

## ---- results = 'hide'---------------------------------------------------
intuEnv() %>%
  ntbt(summary, "lmfit <||>")

## ---- results = 'hide'---------------------------------------------------
intuEnv() %>%
  ntbt(I, "lmfit <|i| summary >")

## ------------------------------------------------------------------------
clear_intuEnv()

ls(intuEnv())

## ------------------------------------------------------------------------
ls()

## ------------------------------------------------------------------------
saved_intuEnv <- set_intuEnv(globalenv())

## ------------------------------------------------------------------------
coll %>%
  ntbt_lm(conc ~ uptake, "CO3 <|f|> lmfit") %>%
  ntbt_cor.test(CONT, INTG, "USJudgeRatings1 <|f|> ctres") %>%
  ntbt_t.test(extra ~ group, "sleep1 <|f|> ttres") %>%
  names()

## ------------------------------------------------------------------------
set_intuEnv(saved_intuEnv)

## ------------------------------------------------------------------------
ls()

## ---- results = 'hide'---------------------------------------------------
lmfit %>%
  summary()

## ------------------------------------------------------------------------
clear_intuEnv()

ls(intuEnv())

## ------------------------------------------------------------------------
intuEnv(CO3 = CO2,
        USJudgeRatings1 = USJudgeRatings,
        sleep1 = sleep)

ls(intuEnv())

## ------------------------------------------------------------------------
intuEnv() %>%
  ntbt(subset, Treatment == "nonchilled", "CO3 <||> CO3nc") %>%
  ntbt_lm(conc ~ uptake, "CO3nc <||> lmfit") %>%
  ntbt_cor.test(CONT, INTG, "USJudgeRatings1 <||> ctres") %>%
  ntbt_t.test(extra ~ group, "sleep1 <||> ttres") %>%
  ntbt(summary, "lmfit <||> lmsfit") %>%
  names()

## ------------------------------------------------------------------------
intuEnv() %>%
  ntbt(subset, CO3, Treatment == "nonchilled", "<||> CO3nc")

## ------------------------------------------------------------------------
iBag <- intuBag(CO3 = CO2,
                USJudgeRatings1 = USJudgeRatings,
                sleep1 = sleep)

## ------------------------------------------------------------------------
iBag %>%
  ntbt(subset, Treatment == "nonchilled", "CO3 <||> CO3nc") %>%
  ntbt_lm(conc ~ uptake, "CO3nc <||> lmfit") %>%
  ntbt_cor.test(CONT, INTG, "USJudgeRatings1 <||> ctres") %>%
  ntbt_t.test(extra ~ group, "sleep1 <||> ttres") %>%
  ntbt(summary, "lmfit <||> lmsfit") %>%
  names()

## ------------------------------------------------------------------------
iBag <- intuBag(CO3 = CO2,
                USJudgeRatings1 = USJudgeRatings,
                sleep1 = sleep)

iBag %<>%
  ntbt(subset, CO3, Treatment == "nonchilled", "<||> CO3nc") %>%
  ntbt_lm(conc ~ uptake, "CO3nc <||> lmfit")

iBag %<>%
  ntbt_cor.test(CONT, INTG, "USJudgeRatings1 <||> ctres")

iBag %<>%
  ntbt_t.test(extra ~ group, "sleep1 <||> ttres") %>%
  ntbt(summary, "lmfit <||> lmsfit")

names(iBag)

## ------------------------------------------------------------------------
iBag <- intuBag(members = data.frame(name=c("John", "Paul", "George",
                                            "Ringo", "Brian", NA),
                band=c("TRUE",  "TRUE", "TRUE", "TRUE", "FALSE", NA)),
           what_played = data.frame(name=c("John", "Paul", "Ringo",
                                           "George", "Stuart", "Pete"),
                instrument=c("guitar", "bass", "drums", "guitar", "bass", "drums")))
print(iBag)

## ------------------------------------------------------------------------
iBag %>%
  ntbt(merge, members, what_played, by = "name", "<|| print >")

## ---- eval = FALSE-------------------------------------------------------
#  library(dplyr)
#  library(nycflights13)
#  
#  flights2 <- flights %>%
#    select(year:day, hour, origin, dest, tailnum, carrier)
#  flights2
#  
#  flights2 %>%
#    select(-origin, -dest) %>%
#    left_join(airlines, by = "carrier")
#  
#  ## 13.4.5 Defining the key columns
#  
#  flights2 %>%
#    left_join(weather)
#  
#  flights2 %>%
#    left_join(planes, by = "tailnum")
#  
#  flights2 %>%
#    left_join(airports, c("dest" = "faa"))
#  
#  flights2 %>%
#    left_join(airports, c("origin" = "faa"))

## ---- eval = FALSE-------------------------------------------------------
#  iBag <- intuBag(flightsIB = flights,
#                  airlinesIB = airlines,
#                  weatherIB = weather,
#                  planesIB = planes,
#                  airportsIB = airports)
#  ## Note we are changing the names, to make sure we are not cheating
#  ## (by reading from globalenv()).
#  
#  iBag %<>%
#    ntbt(select, flightsIB, year:day, hour, origin, dest, tailnum, carrier, "<|| head > flights2") %>%
#    ntbt(select, flights2, -origin, -dest, "<|| print > flights3") %>%
#    ntbt(left_join, flights3, airlinesIB, by = "carrier", "<|| print >") %>%
#    ntbt(left_join, flights2, weatherIB, "<|| print >") %>%
#    ntbt(left_join, flights2, planesIB, by = "tailnum", "<|| print >") %>%
#    ntbt(left_join, flights2, airportsIB, c("dest" = "faa"), "<|| print >") %>%
#    ntbt(left_join, flights2, airportsIB, c("origin" = "faa"), "<|| print >")
#  
#  names(iBag)

## ---- eval = FALSE-------------------------------------------------------
#  clear_intuEnv()
#  
#  intuEnv(flightsIB = flights,
#          airlinesIB = airlines,
#          weatherIB = weather,
#          planesIB = planes,
#          airportsIB = airports) %>%
#    ntbt(select, flightsIB, year:day, hour, origin, dest, tailnum, carrier,
#         "<|D| head > flights2") %>%
#    ntbt(select, flights2, -origin, -dest, "<|| print > flights3") %>%
#    ntbt(left_join, flights3, airlinesIB, by = "carrier", "<|| print >") %>%
#    ntbt(left_join, flights2, weatherIB, "<|| print >") %>%
#    ntbt(left_join, flights2, planesIB, by = "tailnum", "<|| print >") %>%
#    ntbt(left_join, flights2, airportsIB, c("dest" = "faa"), "<|| print >") %>%
#    ntbt(left_join, flights2, airportsIB, c("origin" = "faa"), "<|| print >")
#  
#  ls(intuEnv())

## ---- eval = FALSE-------------------------------------------------------
#  ntbt_lm <- function(data, formula, ...)
#    lm(formula, data, ...)

