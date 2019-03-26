## ---- echo = FALSE, include = FALSE--------------------------------------
suppressPackageStartupMessages(library(knitr))
suppressPackageStartupMessages(library(gridExtra))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))
library(breathtestcore)
knitr::opts_knit$set(unnamed.chunk.label = "btcore_")
opts_chunk$set(comment = NA, fig.width = 4, fig.height = 3)
options(digits = 3)
set.seed(4711)

## ---- eval = FALSE-------------------------------------------------------
#  exp_beta = function(minute,dose,m,k,beta) {
#       m*dose*k*beta*(1-exp(-k*minute))^(beta-1)*exp(-k*minute)
#  }

## ---- expb, fig.width = 6, echo = FALSE, fig.cap = "Examples of exponential beta functions used to fit breath test curves. _Bottom-up arrow_: Maes/Ghoos lag time. _Top-down arrow_: Maes/Ghoos half emptying time."----
k = c(0.025, 0.015)
beta=c(1.5, 4, 8)
g = expand.grid(minute = 0:300, k = k, beta = beta) %>% 
  mutate(
    pdr = exp_beta(minute, 100, 40, k, beta)
  )
gpar = expand.grid(k = k, beta = beta) %>% 
  mutate(
    t50 = t50_maes_ghoos(.),
    tlag = tlag_maes_ghoos(.),
    y_t50 = exp_beta(t50, 100, 40, k, beta),
    y_tlag = exp_beta(tlag, 100, 40, k, beta)
  )
arrow_1 = arrow(length = unit(0.1, "inches"), type = "closed")
ggplot(g, aes(minute, pdr, color = as.character(beta))) + 
  geom_line() + 
  facet_grid(~paste("k=",k)) + 
  labs(color='beta') + 
  geom_segment(aes(x = t50, y = y_t50 + 5, xend = t50, yend = y_t50 + .3), 
               data = gpar, size = 1, arrow = arrow_1 ) +
  geom_segment(aes(x = tlag, y = y_tlag-10, xend = tlag, yend = y_tlag - .3), 
               data = gpar, size = 1, arrow = arrow_1) 

## ---- t50, echo = FALSE, fig.cap = "The half-emptying time in the definition of Maes/Ghoos is the time where the area under curve (AUC) is half of the AUC under the curve extrapolated to infinity."----
t50 = (gpar %>% filter(beta == 1.5 & k == 0.015 ))$t50

g %>% filter(beta == 1.5 & k == 0.015 ) %>% 
  ggplot(aes(minute, pdr)) +
  geom_line() +
  geom_area(data = . %>% filter(minute > t50), fill = "lightgray")  +
  geom_area(data = . %>% filter(minute < t50)) 
  
  

## ---- gamma, fig.cap = "Gamma function from @Ghoos1993 definition as points, and fitted beta exponential as line. Both function look very similar, but the area under the gamma function is infinite and thus cannot be used to compute t50.", echo = FALSE----
gam = function(minute, a, b, c){
  a * minute^b * exp(-c*minute)
}

data_frame(minute = seq(0, 300, by = 10)) %>% 
  mutate(
    pdr = gam(minute, 1, 1.5, 0.03)
  ) %>% 
  cleanup_data() %>% 
  nls_fit() %>% 
  plot(point_size = 2)



## ---- fig.height = 2.5, fig.cap="The fitting methods available in package `breathtestshiny` and in the [online version](https://apps.menne-biomed.de/breathtestshiny/).", echo = FALSE----
knitr::include_graphics("methods.png")

## ---- foc, fig.width = 7, fig.asp = 0.4, echo = FALSE, fig.cap="Left: pharmcological PDR response of separated loads released in the smaller bowel after 0, 30 and 90 minutes. Right: sum response when all three loads are released successively."----
foc = function(minute, t_lag, dose, clearance, k1, k2)  {
  norm = dose * k1 * k2/(clearance * (k2-k1)) 
  m_lag = pmax(minute - t_lag, 0)
  f =  norm * ((exp(-k1 * m_lag)) - (exp(-k2 * m_lag)))
}  
ff = expand.grid(minute = 0:300, t_lag_n = c(0, 30, 90)) %>% 
  mutate(
    pdr = foc(minute, t_lag_n, 25, 1, 0.2, 0.05),
    t_lag = as.character(t_lag_n)
  ) 
p1 = ff %>% 
   ggplot(aes(x = minute, y = pdr, group = t_lag, col = t_lag)) +
   geom_line()

p2 = ff %>% 
  group_by(minute) %>% 
  summarize(pdr = sum(pdr)) %>% 
  ggplot(aes(x = minute, y = pdr )) + geom_line()
gridExtra::grid.arrange(p1, p2, ncol = 2, nrow = 1)


## ---- echo = FALSE-------------------------------------------------------
tempt = 100
beta = 1.8
cap = paste0("Meal volume (left) and flow when gastric emptying function is a power exponential function. Slope was computed with  function `gastempt::powexp_slope()` with inverted sign. 400 ml initial value, tempt = ", tempt, ", beta = ", beta, " Half empyting times t50 are marked by arrows." )

## ---- powexp, fig.height = 3, fig.width = 8, echo = FALSE, fig.cap = cap----

# Stolen and simplfied from package gastempt
powexp = function(t, v0, tempt, beta){
  v0 * exp(-(t / tempt) ^ beta)
} 

powexp_slope = function(t, v0, tempt, beta){
  .expr1 <- t/tempt
  .expr4 <- v0 * exp(-.expr1^beta)
  -(.expr4 * (.expr1^(beta - 1) * (beta * (1/tempt))))
}
 
t50_powexp = function(tempt, beta){
  interval = c(0, 1000)
  uniroot(function(t)
        powexp(t, 1, tempt, beta ) - 0.5,
        interval = interval)$root
}

flow = expand.grid(minute = 0:300) %>% 
  mutate(
    flow = - powexp_slope(minute, 400, tempt, beta),
    vol = powexp(minute, 400, tempt, beta)
  ) 


t50_pp = round(t50_powexp(tempt = tempt, beta = beta))
  

p1 = flow %>% 
  ggplot(aes(minute, vol)) + geom_line() +
  ylab("vol in stomach (ml" ) + 
  geom_segment(
    aes(x = t50_pp+50, y = 250, xend = t50_pp, yend = 200),
    size = 1, arrow = arrow_1 )

p2 = flow %>% 
  ggplot(aes(minute, flow)) + geom_line() +
  ylab("Flow out of stomach in ml/m" )

# Convolution
ff_0 = (ff %>%  filter(t_lag == 0))$pdr
cv =  data.frame(minute = 0:300, pdr = 
   convolve(flow$flow, rev(ff_0), type = "open")[1:301]) 

t50_pdr = (cv %>% 
  cleanup_data() %>% 
  nls_fit() %>% 
  coef() %>% 
  filter(method == "maes_ghoos", parameter == "t50"))$value

p3 = cv %>% 
  ggplot(aes(minute, pdr)) + geom_line() +
  ylab("Expected PDF (not normalized)") +
  geom_segment(
    aes(x = t50_pdr, y = 45, xend = t50_pdr+50, yend = 40),
    size = 1, arrow = arrow_1 )

gridExtra::grid.arrange(p1, p2, p3, ncol = 3, nrow = 1)



## ---- sim2stage, fig.cap = "Simulated response of a two-stage breath test procedure. The peak within the first hour is from acetate directly released in the small bowel, the second wider peak is the result of the convolution of transport emptying and pharmacokinetics."----
  data.frame(pdr = c(ff_0[0:59]*50, rep(0, 20), cv$pdr)) %>% 
  mutate(
    minute = 0:(n()-1)
  ) %>% 
  filter(minute %% 10 == 0) %>% 
  mutate(
    pdr = pdr + rnorm(n(), 0, 1)
  ) %>% 
  ggplot(aes(x = minute, y = pdr)) +
           geom_point() + geom_line(col = "gray") +
  scale_x_continuous(breaks = seq(0, 360, by = 60))

