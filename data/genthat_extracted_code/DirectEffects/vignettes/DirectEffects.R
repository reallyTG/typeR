## ----loadpkg, echo = FALSE, include = FALSE------------------------------
knitr::opts_chunk$set(fig.width = 5, fig.height = 4, fig.align = "center")
library(dplyr)
library(scales)
library(reshape2)
library(ggplot2)
library(DirectEffects) 

## ---- echo = FALSE, out.width = "600px", fig.align='center'--------------
knitr::include_graphics("figures/ABS_fig3.png")

## ------------------------------------------------------------------------
data(ploughs)

## ------------------------------------------------------------------------
ate.mod <- lm(women_politics ~ plow + agricultural_suitability +
                tropical_climate +  large_animals + political_hierarchies +
                economic_complexity + rugged, data = ploughs)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
summary(ate.mod)

## ------------------------------------------------------------------------
form_main <- women_politics ~ plow + agricultural_suitability + tropical_climate +
  large_animals + political_hierarchies + economic_complexity + rugged |
  years_civil_conflict + years_interstate_conflict  + oil_pc + european_descent +
  communist_dummy + polity2_2000 + serv_va_gdp2000 |
  centered_ln_inc + centered_ln_incsq

## ---- echo = TRUE, eval = TRUE-------------------------------------------
direct <- sequential_g(form_main, data = ploughs)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
summary(direct)

## ------------------------------------------------------------------------
out.boots <- boots_g(direct)
summary(out.boots)

## ---- echo = FALSE, fig.width= 7, fig.height=4---------------------------
df.coef <- rbind(summary(ate.mod)$coef["plow", ],
               summary(direct)$coef["plow", ]) %>% 
  as.data.frame()  %>%
  mutate(pos = c("ATE of Plows", "ACDE of Plows,\nvia sequential g-estimation"))

ggplot(df.coef, aes(x = Estimate, y = pos)) +
  geom_point() +
  geom_errorbarh(data = df.coef, aes(xmin = Estimate + 1.96*`Std. Error`, xmax = Estimate - 1.96*`Std. Error`), height = 0.1) +
  scale_x_continuous(limits = c(-10, 5)) +
  geom_vline(xintercept = 0, linetype = 2) +
  geom_text(aes(label = round(Estimate, 1)), nudge_y = 0.1) +
  theme_bw() +
  labs(x = "Estimated Causal Effects on Percent of Women in Political Office",
       y = "",
       caption = "Lines are 95% confidence intervals")

## ------------------------------------------------------------------------
coef(direct)

## ------------------------------------------------------------------------
confint(direct, "plow")

## ------------------------------------------------------------------------
vcov(direct)[1:3, 1:3]

## ------------------------------------------------------------------------
# update with only one mediator
direct1 <- sequential_g(women_politics ~ plow + agricultural_suitability + tropical_climate +
  large_animals + political_hierarchies + economic_complexity + rugged |
  years_civil_conflict + years_interstate_conflict  + oil_pc + european_descent +
  communist_dummy + polity2_2000 + serv_va_gdp2000 |
  centered_ln_inc,
  ploughs)
out_sens <- cdesens(direct1, var = "plow")
plot(out_sens)

