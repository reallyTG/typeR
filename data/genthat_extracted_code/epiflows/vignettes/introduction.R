## ----install2, eval = FALSE----------------------------------------------
#  if (!require("remotes")) install.packages("remotes", repos = "https://cloud.rstudio.org")
#  remotes::install_github("reconhub/epiflows")

## ----the_estimate--------------------------------------------------------
library("epiflows")
library("ggplot2")
data("Brazil_epiflows")
print(Brazil_epiflows)
set.seed(2018-07-25)
res <- estimate_risk_spread(Brazil_epiflows, 
                            location_code = "Espirito Santo",
                            r_incubation = function(n) rlnorm(n, 1.46, 0.35),
                            r_infectious = function(n) rnorm(n, 4.5, 1.5/1.96),
                            n_sim = 1e5
                           )
res
res$location <- rownames(res)
ggplot(res, aes(x = mean_cases, y = location)) +
  geom_point(size = 2) +
  geom_errorbarh(aes(xmin = lower_limit_95CI, xmax = upper_limit_95CI), height = .25) +
  theme_bw(base_size = 12, base_family = "Helvetica") +
  ggtitle("Yellow Fever Spread from Espirito Santo, Brazil") +
  xlab("Number of cases") +
  xlim(c(0, NA))

## ----make_epiflows-------------------------------------------------------
data("YF_locations")
data("YF_flows")
data("YF_coordinates")
loc <- merge(x = YF_locations, 
             y = YF_coordinates,
             by.x = "location_code",
             by.y = "id",
             sort = FALSE)
loc
ef <- make_epiflows(flows         = YF_flows, 
                    locations     = loc, 
                    coordinates   = c("lon", "lat"), 
                    pop_size      = "location_population",
                    duration_stay = "length_of_stay",
                    num_cases     = "num_cases_time_window",
                    first_date    = "first_date_cases",
                    last_date     = "last_date_cases"
                   )
ef

## ----plotting------------------------------------------------------------
vis_epiflows(ef)
map_epiflows(ef)
grid_epiflows(ef)

