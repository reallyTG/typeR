## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  screenshot.force = FALSE,
  comment = "#>"
)
library(weibulltools)

# set.seed() for reproducibility of random sampled id's
set.seed(2905)

## ----rank densities, fig.cap = "Figure 1: Densities for different ranks i in samples of size n = 10.", message = FALSE----
library(tidyverse) # using dplyr manipulation functions and ggplot2

x <- seq(0, 1, length.out = 100) # CDF
n <- 10 # sample size
i <- c(1, 3, 5, 7, 9) # ranks
r <- n - i + 1 # inverse ranking

df_dens <- expand.grid(cdf = x, i = i) %>% 
  mutate(n = n, r = n - i + 1, pdf = dbeta(x = x, shape1 = i, shape2 = r))

densplot <- ggplot(data = df_dens, aes(x = cdf, y = pdf, colour = as.factor(i))) + 
  geom_line() + 
  scale_colour_discrete(guide = guide_legend(title = "i")) + 
  theme_bw() + 
  labs(x = "Failure Probability", y = "Density")
densplot

## ----dataset shock, fig.cap = "Figure 2: Boxplots for different modes.", message = FALSE----
library(SPREDA) # for dataset shock
data(shock)
# generate random ids for units: 
shock$id <- sample(c(letters, LETTERS), size = nrow(shock), replace = FALSE)

# using tibble for better print: 
as_tibble(shock)

# Comparison of failure modes: 
ggplot(data = shock, aes(x = Mode, y = Distance)) + 
  geom_boxplot() + 
  theme_bw()

## ----failure probabilities, results = 'asis'-----------------------------
# First case where only failed units are taken into account:
df_mr <- mr_method(id = shock$id[shock$Censor == 1], 
                   x = shock$Distance[shock$Censor == 1], 
                   event = shock$Censor[shock$Censor == 1])
knitr::kable(df_mr, format = "html", row.names = FALSE, align = "c", 
             caption = "Table 1: Failure probabilities using failed items.")

# Second case where both, survived and failed units are considered:
df_john <- johnson_method(id = shock$id, x = shock$Distance, event = shock$Censor)
knitr::kable(df_john, format = "html", row.names = FALSE, align = "c", 
             caption = "Table 2: Failure probabilities using all items.") 

## ----probability plot weibull, fig.cap = "Figure 3: Plotting positions in weibull grid.", message = FALSE----
# Weibull grid for probabilities calculated with Johnson: 
weibull_grid <- plot_prob(x = df_john$characteristic, y = df_john$prob, 
                          event = df_john$status, id = df_john$id, 
                          distribution = "weibull", 
                          title_main = "Weibull Probability Plot", 
                          title_x = "Mileage in km", 
                          title_y = "Probability of Failure in %",
                          title_trace = "Failures (Johnson)")

library(plotly) # Using add_trace()
# Adding a trace so that estimated probabilities of mr_method can be plotted in 
# the same graph: 
# Arguments inside add_trace: 
#   y: Must be transformed such that quantiles of smallest extreme value distribution are plotted. 
#   x: Since distribution in plot_prob is "weibull" the x axis is already on log scale. 
#      Thus x can be plugged in on natural scale. 
weibull_grid_both <- weibull_grid %>% 
  add_trace(data = df_mr, type = "scatter", mode = "markers", x = ~characteristic, 
    y = ~SPREDA::qsev(prob), name = "Failures (MR)", color = I("#006400"), 
    hoverinfo = "text", text = ~paste("ID:", id,
      paste("<br>", paste0("Mileage", ":")), characteristic, 
      paste("<br>", paste0("Probability", ":")), round(prob, digits = 5))) 
weibull_grid_both

## ----probability plot log-normal, fig.cap = "Figure 4: Plotting positions in log-normal grid.", message = FALSE----
# Log-Normal grid for probabilities calculated with Johnson: 
lognorm_grid <- plot_prob(x = df_john$characteristic, y = df_john$prob,
                          event = df_john$status, id = df_john$id,
                          distribution = "lognormal",
                          title_main = "Log-Normal Probability Plot",
                          title_x = "Mileage in km",
                          title_y = "Probability of Failure in %",
                          title_trace = "Defect Shock Absorbers")
lognorm_grid

