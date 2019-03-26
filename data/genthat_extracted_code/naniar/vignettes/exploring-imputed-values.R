## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----demonstrate-impute-below--------------------------------------------
library(dplyr)
library(naniar)

airquality %>%
  impute_below_at(vars(Ozone)) %>%
  select(Ozone, Solar.R) %>%
  head()

## ----impute-vector, echo = TRUE------------------------------------------

impute_mean(oceanbuoys$air_temp_c) %>% head()

impute_mean_at(oceanbuoys, .vars = vars(air_temp_c)) %>% head()

impute_mean_if(oceanbuoys, .predicate = is.integer) %>% head()

impute_mean_all(oceanbuoys) %>% head()


## ----bind-impute-label-example, echo = TRUE------------------------------

library(simputation)
ocean_imp <- oceanbuoys %>%
  bind_shadow() %>%
  impute_lm(air_temp_c ~ wind_ew + wind_ns) %>%
  impute_lm(humidity ~  wind_ew + wind_ns) %>%
  impute_lm(sea_temp_c ~  wind_ew + wind_ns) %>%
  add_label_shadow()


## ----ocean-imp-air-temp-humidity-----------------------------------------
library(ggplot2)
ggplot(ocean_imp,
       aes(x = air_temp_c,
           y = humidity,
           color = any_missing)) + 
  geom_point() +
  scale_color_brewer(palette = "Dark2") +
  theme(legend.position = "bottom")

## ----ocean-imp-density, fig.show = "hold", fig.height = 4, fig.width = 4, out.width = "49%"----

ggplot(ocean_imp,
       aes(x = air_temp_c,
           fill = any_missing)) + 
  geom_density(alpha = 0.3) + 
  scale_fill_brewer(palette = "Dark2") +
  theme(legend.position = "bottom")

ggplot(ocean_imp,
       aes(x = humidity,
           fill = any_missing)) + 
  geom_density(alpha = 0.3) + 
  scale_fill_brewer(palette = "Dark2") +
  theme(legend.position = "bottom")


## ----summarise-imputations-----------------------------------------------
ocean_imp %>%
  group_by(any_missing) %>%
  summarise_at(.vars = vars(air_temp_c),
               .funs = funs(min, mean, median, max, .args = list(na.rm = TRUE)))

## ----imp-add-year--------------------------------------------------------
ocean_imp_yr <- oceanbuoys %>%
  bind_shadow() %>%
  impute_lm(air_temp_c ~ wind_ew + wind_ns + year + longitude + latitude) %>%
  impute_lm(humidity ~  wind_ew + wind_ns + year + longitude + latitude) %>%
  impute_lm(sea_temp_c ~  wind_ew + wind_ns + year + longitude + latitude) %>%
  add_label_shadow()

## ----ggplot-air-temp-humidity--------------------------------------------
ggplot(ocean_imp_yr,
       aes(x = air_temp_c,
           y = humidity,
           color = any_missing)) + 
  geom_point() +
  scale_color_brewer(palette = "Dark2") +
  theme(legend.position = "bottom")

## ----Hmisc-aregimpute----------------------------------------------------

library(Hmisc)

aq_imp <- aregImpute(~Ozone + Temp + Wind + Solar.R,
                     n.impute = 1,
                     type = "pmm",
                     data = airquality)

aq_imp

## ----Hmisc-aregimpute-insert---------------------------------------------

# nabular form!
aq_nab <- nabular(airquality) %>%  add_label_shadow()

# insert imputed values
aq_nab$Ozone[is.na(aq_nab$Ozone)] <- aq_imp$imputed$Ozone
aq_nab$Solar.R[is.na(aq_nab$Solar.R)] <- aq_imp$imputed$Solar.R


## ----hmisc-aregimpute-vis------------------------------------------------

ggplot(aq_nab,
       aes(x = Ozone,
           y = Solar.R,
           colour = any_missing)) + 
  geom_point()


