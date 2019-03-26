## ---- eval = T, message = F----------------------------------------------
library(medicare)
library(dplyr)
library(magrittr)
# optional for final maps
library(ggplot2)
library(maps)

## ---- eval = T-----------------------------------------------------------
alpha_14 <- hospiceALPHA
nmrc_14 <- hospiceNMRC
rpt_14 <- hospiceRPT

## ---- eval = T-----------------------------------------------------------
names(alpha_14) <- cr_alpha_names()
names(nmrc_14) <- cr_nmrc_names()
names(rpt_14) <- cr_rpt_names()

lapply(list(alpha_14, nmrc_14, rpt_14), head)

## ------------------------------------------------------------------------
hospice_names <- cr_extract(alpha_14, "S100000", 100, 100, "hospice_name")
nrow(hospice_names)
hospice_names_nmrc <- cr_extract(nmrc_14, "S100000", 100, 100, "hospice_name")

## ------------------------------------------------------------------------
hospice_address <- cr_extract(alpha_14, "S100000", 100, 200, "address")
hospice_state <- cr_extract(alpha_14, "S100000", 100, 400, "state")
hospice_zip <- cr_extract(alpha_14, "S100000", 100, 500, "zip")
hospice_ownership <- cr_extract(nmrc_14, "S100000", 700, 100, "ownership")
hospice_benes <- cr_extract(nmrc_14, "S100000", 1600, 600, "benes")
hospice_costs <- cr_extract(nmrc_14, "G200002", 1500, 200, "costs")
hospice_revenues <- cr_extract(nmrc_14, "G200001", 600, 100, "revenues")
hospice_net_income <- cr_extract(nmrc_14, "G200002", 1600, 200, "net_income")

## ---- message = F--------------------------------------------------------
hospice_data <- Reduce(full_join, list(hospice_names, hospice_address, 
                                       hospice_state, hospice_zip, hospice_ownership,
                                       hospice_benes, hospice_costs, 
                                       hospice_revenues, hospice_net_income))

## ------------------------------------------------------------------------
head(hospice_data)

## ---- message = F--------------------------------------------------------
hospice_rpt_info <- rpt_14 %>% select(rpt_rec_num, prvdr_num, fy_bgn_dt, fy_end_dt)
hospice_all <- full_join(hospice_rpt_info, hospice_data)

## ---- fig.width = 6, fig.height = 4--------------------------------------
hospice_all <- hospice_all %>%
  mutate(
    profit_group = ifelse(ownership <= 2, "nonprofit", 
                          ifelse(ownership > 2 & ownership <= 6, "for-profit",
                                 "government"))
  ) %>%
  mutate(
    profit_group = factor(profit_group, levels = c("for-profit", "nonprofit", "government")),
    per_bene_margin = net_income / benes
  )

# drop extreme outliers
upper_bound <- quantile(hospice_all$per_bene_margin, 0.99, na.rm = T)
lower_bound <- quantile(hospice_all$per_bene_margin, 0.01, na.rm = T)

graph_data <- hospice_all %>%
  filter(
    !is.na(per_bene_margin), 
    per_bene_margin <= upper_bound, 
    per_bene_margin >= lower_bound
  )

ggplot() +
  geom_boxplot(data = graph_data, aes(profit_group, per_bene_margin))


## ---- fig.width = 6, fig.height = 4--------------------------------------
# use the state geometry files from the 'data' package
state_map = map_data("state")

# make lower, to conform to state_map values
states <- data.frame(state.abb, state.name)
names(states) <- c("state", "state_name")
states$state <- as.character(states$state)
states$state_name <- tolower(states$state_name)

graph_data %<>% full_join(states, by = "state")

mean_by_state <- graph_data %>%
  filter(!is.na(state_name)) %>%
  group_by(state_name, profit_group) %>%
  summarize(
    mean_profits = mean(per_bene_margin, na.rm = T)
  )

ggplot() +
  geom_map(data = mean_by_state, 
           aes(map_id = state_name, fill = mean_profits),
           map = state_map) +
  expand_limits(x = state_map$long, y = state_map$lat) +
  facet_wrap(~profit_group) +
  scale_fill_gradient(low = "red", high = "blue")

