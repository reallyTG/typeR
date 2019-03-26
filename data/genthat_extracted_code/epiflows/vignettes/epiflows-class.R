## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----global_vars---------------------------------------------------------
library("epiflows")
global_vars()

## ------------------------------------------------------------------------
library("epiflows")
data("YF_flows")
data("YF_locations")
head(YF_flows)
YF_locations

## ------------------------------------------------------------------------
ef <- make_epiflows(flows         = YF_flows, 
                    locations     = YF_locations, 
                    pop_size      = "location_population",
                    duration_stay = "length_of_stay",
                    num_cases     = "num_cases_time_window",
                    first_date    = "first_date_cases",
                    last_date     = "last_date_cases"
                   )
print(ef)

## ----estimate------------------------------------------------------------
incubation <- function(n) {
  rlnorm(n, 1.46, 0.35)
}

infectious <- function(n) {
  rnorm(n, 4.5, 1.5/1.96)
}
set.seed(2017-07-25)
res <- estimate_risk_spread(ef, 
                            location_code          = "Espirito Santo",
                            r_incubation           = incubation,
                            r_infectious           = infectious,
                            n_sim                  = 1e5)
res

## ----plot-estimate, fig.width = 7, fig.height = 3------------------------
library("ggplot2")
res$location <- factor(rownames(res), rownames(res))
ggplot(res, aes(x = mean_cases, y = location)) +
  geom_point(size = 2) +
  geom_errorbarh(aes(xmin = lower_limit_95CI, xmax = upper_limit_95CI), height = .25) +
  theme_bw(base_size = 12, base_family = "Helvetica") +
  ggtitle("Yellow Fever Spread from Espirito Santo, Brazil") +
  xlab("Number of cases") +
  xlim(c(0, NA))

## ----plot-estimate-sim, fig.width = 7, fig.height = 3--------------------
set.seed(2017-07-25)
res <- estimate_risk_spread(ef, 
                            location_code          = "Espirito Santo",
                            r_incubation           = incubation,
                            r_infectious           = infectious,
                            n_sim                  = 1e5,
                            return_all_simulations = TRUE)
head(res)
library("ggplot2")
ggplot(utils::stack(as.data.frame(res)), aes(x = ind, y = values)) +
  geom_boxplot(outlier.alpha = 0.2) +
  theme_bw(base_size = 12, base_family = "Helvetica") +
  ggtitle("Yellow Fever Spread from Espirito Santo, Brazil") +
  ylab("Number of cases") +
  xlab("Location") +
  ylim(c(0, NA)) +
  coord_flip()


## ----fakedata------------------------------------------------------------
data("YF_Brazil")
set.seed(5000)
short_stays <- as.data.frame(replicate(5, rpois(10, 5) + round(runif(10), 1)))
colnames(short_stays) <- c("ES", "MG", "RdJ", "SP", "SB")
rownames(short_stays) <- names(YF_Brazil$length_of_stay)
short_stays

## ----merge---------------------------------------------------------------
short_stays$location_code <- rownames(short_stays)
(locations <- merge(YF_locations, short_stays, by = "location_code", all = TRUE, sort = FALSE))

## ------------------------------------------------------------------------
ef <- make_epiflows(flows         = YF_flows, 
                    locations     = locations, 
                    pop_size      = "location_population",
                    duration_stay = "length_of_stay",
                    num_cases     = "num_cases_time_window",
                    first_date    = "first_date_cases",
                    last_date     = "last_date_cases"
                   )

## ----plot-estimate-dummy, fig.width = 7, fig.height = 3------------------
get_vars(ef)$duration_stay
set_vars(ef, "duration_stay") <- "ES"
get_vars(ef)$duration_stay
set.seed(2017-07-25)
incubation <- function(n) {
  rlnorm(n, 1.46, 0.35)
}

infectious <- function(n) {
  rnorm(n, 4.5, 1.5/1.96)
}
set.seed(2017-07-25)
res <- estimate_risk_spread(ef, 
                            location_code          = "Espirito Santo",
                            r_incubation           = incubation,
                            r_infectious           = infectious,
                            n_sim                  = 1e5)
res$location <- factor(rownames(res), rownames(res))
ggplot(res, aes(x = mean_cases, y = location)) +
  geom_point(size = 2) +
  geom_errorbarh(aes(xmin = lower_limit_95CI, xmax = upper_limit_95CI), height = .25) +
  theme_bw(base_size = 12, base_family = "Helvetica") +
  ggtitle("Yellow Fever Spread from Espirito Santo, Brazil") +
  xlab("Number of cases") +
  xlim(c(0, NA))

## ----plot-estimate-dummy2, fig.width = 7, fig.height = 3-----------------

set_vars(ef, "duration_stay") <- "length_of_stay"

set.seed(2017-07-25)
res <- estimate_risk_spread(ef, 
                            location_code          = "Espirito Santo",
                            r_incubation           = incubation,
                            r_infectious           = infectious,
                            n_sim                  = 1e5)
res$location <- factor(rownames(res), rownames(res))
ggplot(res, aes(x = mean_cases, y = location)) +
  geom_point(size = 2) +
  geom_errorbarh(aes(xmin = lower_limit_95CI, xmax = upper_limit_95CI), height = .25) +
  theme_bw(base_size = 12, base_family = "Helvetica") +
  ggtitle("Yellow Fever Spread from Espirito Santo, Brazil") +
  xlab("Number of cases") +
  xlim(c(0, NA))

## ----plot-estimate-dummy3, fig.width = 7, fig.height = 3-----------------
set.seed(2017-07-25)
res <- estimate_risk_spread(ef, 
                            location_code          = "Espirito Santo",
                            r_incubation           = incubation,
                            r_infectious           = infectious,
                            n_sim                  = 1e5,
                            avg_length_stay_days   = rep(2, 10))
res$location <- factor(rownames(res), rownames(res))
ggplot(res, aes(x = mean_cases, y = location)) +
  geom_point(size = 2) +
  geom_errorbarh(aes(xmin = lower_limit_95CI, xmax = upper_limit_95CI), height = .25) +
  theme_bw(base_size = 12, base_family = "Helvetica") +
  ggtitle("Yellow Fever Spread from Espirito Santo, Brazil") +
  xlab("Number of cases") +
  xlim(c(0, NA))

