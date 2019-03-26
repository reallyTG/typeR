## ----knitr-setup, include = FALSE----------------------------------------
knitr::opts_chunk$set(fig.align = "center",
                      fig.width = 5,
                      fig.height = 4,
                      dpi = 100)


## ----vis-dat, echo = TRUE------------------------------------------------
library(visdat)
vis_dat(airquality)


## ----vis-miss-cluster-vanilla--------------------------------------------

vis_miss(airquality)


## ----example-geom-point, echo = TRUE, fig.width = 5, fig.height=3--------
library(ggplot2)
ggplot(airquality, 
       aes(x = Solar.R, 
           y = Ozone)) + 
  geom_point()

## ----geom-miss-point, echo = TRUE, out.width = "50%", fig.show='hold'----

ggplot(airquality, 
       aes(x = Solar.R, 
           y = Ozone)) + 
  geom_point()

library(naniar)

ggplot(airquality, 
       aes(x = Solar.R, 
           y = Ozone)) + 
  geom_miss_point()


## ----ggmissing-facet, echo = TRUE, out.width = "70%"---------------------

ggplot(airquality, 
       aes(x = Solar.R, 
           y = Ozone)) + 
  geom_miss_point() + 
  facet_wrap(~Month)


## ----ggmissing-theme, echo = TRUE, out.width = "70%"---------------------

ggplot(airquality, 
       aes(x = Solar.R, 
           y = Ozone)) + 
  geom_miss_point() + 
  facet_wrap(~Month) + 
  theme_dark()


## ----gg-miss-var---------------------------------------------------------

gg_miss_var(airquality)


## ----gg-miss-var-theme---------------------------------------------------
gg_miss_var(airquality) + theme_bw() 

gg_miss_var(airquality) + labs(y = "Look at all the missing ones")


## ----gg-miss-var-facet---------------------------------------------------
gg_miss_var(airquality, facet = Month)

## ----mds-fig, out.width = "800px", echo = F------------------------------
knitr::include_graphics("missingness-data-structures.png")

## ----as-shadow-----------------------------------------------------------

as_shadow(airquality)


## ----bind-shadow, echo = TRUE--------------------------------------------

aq_shadow <- bind_shadow(airquality)
aq_nab <- nabular(airquality)

library(dplyr)

glimpse(aq_shadow)
glimpse(aq_nab)

all.equal(aq_shadow, aq_nab)


## ----bind-shadow-pattern-------------------------------------------------

airquality %>%
  bind_shadow() %>%
  group_by(Ozone_NA) %>%
  summarise_at(.vars = "Solar.R",
               .funs = c("mean", "sd", "var", "min", "max"),
               na.rm = TRUE)

## ----shadow-plot, echo = TRUE, out.width = "60%"-------------------------

ggplot(aq_shadow,
       aes(x = Temp,
           colour = Ozone_NA)) + 
  geom_density()


## ----simpute-invisible, echo = TRUE, fig.height = 3----------------------

library(simputation)
library(dplyr)

airquality %>%
  impute_lm(Ozone ~ Temp + Wind) %>%
  ggplot(aes(x = Temp,
             y = Ozone)) + 
  geom_point()
  

## ----simpute-visible, echo = TRUE, fig.height = 3------------------------

aq_shadow %>%
  impute_lm(Ozone ~ Temp + Wind) %>%
  ggplot(aes(x = Temp,
             y = Ozone,
             colour = Ozone_NA)) + 
  geom_point()
  

## ----helpers-n-miss, echo = TRUE-----------------------------------------

dplyr::n_distinct(airquality)
dplyr::n_distinct(airquality$Ozone)

n_miss(airquality)
n_miss(airquality$Ozone)

n_complete(airquality)
n_complete(airquality$Ozone)


## ----miss-case-prop------------------------------------------------------
miss_case_prop(airquality)
miss_case_pct(airquality)

## ----miss-case-summary---------------------------------------------------

miss_case_summary(airquality)


## ----miss-case-table-----------------------------------------------------

miss_case_table(airquality)


## ----miss-var-prop-------------------------------------------------------

miss_var_prop(airquality)
miss_var_pct(airquality)


## ----miss-var-summary----------------------------------------------------

miss_var_summary(airquality)


## ----miss-var-table------------------------------------------------------

miss_var_table(airquality)


## ----miss-var-run--------------------------------------------------------
miss_var_run(pedestrian,
             hourly_counts)

## ----ped-miss-var-span---------------------------------------------------

miss_var_span(pedestrian,
              hourly_counts,
              span_every = 100)


## ----ped-miss-var-sum----------------------------------------------------

pedestrian %>% miss_var_summary()


## ----ped-group-by-miss-var-sum-------------------------------------------

pedestrian %>%
 group_by(month) %>%
 miss_var_summary() %>%
 filter(variable == "hourly_counts")


## ----add-prop-miss, echo = TRUE------------------------------------------

airquality %>%
  add_prop_miss() %>%
  head()


## ----rpart-miss, echo = TRUE---------------------------------------------

library(rpart)
library(rpart.plot)

airquality %>%
  add_prop_miss() %>%
  rpart(prop_miss_all ~ ., data = .) %>%
  prp(type = 4, extra = 101, prefix = "Prop. Miss = ")


