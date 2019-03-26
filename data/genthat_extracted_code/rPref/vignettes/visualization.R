## ---- echo = FALSE, message = FALSE--------------------------------------
library(rPref)
suppressPackageStartupMessages(library(dplyr))
library(ggplot2)

## ---- fig.width = 6, fig.height = 4--------------------------------------
sky <- psel(mtcars, high(mpg) * high(hp))

ggplot(mtcars, aes(x = mpg, y = hp)) + geom_point(shape = 21) + 
  geom_point(data = sky, size = 3) + geom_step(data = sky, direction = "vh") 

## ------------------------------------------------------------------------
p <- high(mpg) * high(hp)
res <- psel(mtcars, p, top = nrow(mtcars))

## ---- fig.width = 6, fig.height = 4--------------------------------------
ggplot(res, aes(x = mpg, y = hp, color = factor(.level))) +
  geom_point(size = 3) + geom_step(direction = "vh") 

## ---- fig.width = 6, fig.height = 4--------------------------------------
res <- mtcars %>% psel(high(mpg) | high(hp), top = nrow(mtcars)) %>%
  arrange(mpg, -hp)
  
ggplot(res, aes(x = mpg, y = hp, color = factor(.level))) +
  geom_point(size = 3) + geom_step(direction = "vh") 

## ------------------------------------------------------------------------
p <- (true(am == 1) & high(gear)) * high(mpg)

## ------------------------------------------------------------------------
df <- psel(mtcars, p, top_level = 4)
df$num <- 1:nrow(df)
knitr::kable(select(df, num, am, gear, mpg, .level))

## ------------------------------------------------------------------------
plot_btg(df, p)

## ------------------------------------------------------------------------
assoc.df(p) <- df
init_pred_succ(p)

## ---- collapse = TRUE----------------------------------------------------
all_pred(p, 5)

## ---- collapse = TRUE----------------------------------------------------
hasse_pred(p, 5)

## ---- collapse = TRUE----------------------------------------------------
all_pred(p, c(5, 6))

## ---- collapse = TRUE----------------------------------------------------
all_pred(p, c(5, 6), intersect = TRUE)

