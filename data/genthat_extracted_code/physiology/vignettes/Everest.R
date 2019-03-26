## ----setup, include=FALSE------------------------------------------------
library(physiology)
knitr::opts_chunk$set(echo = TRUE)

## ----summmitintro--------------------------------------------------------
library(physiology)
pres_atm_frac(altitude_m = 8850)

## ----correctingh2o-------------------------------------------------------
temp_k = temp_c_to_k(37)
svp <- svp_sea_level(temp_k)
PAH2O_mmHg_summit <- svp * pres_atm_frac(8850)

## ----alveolargasses------------------------------------------------------
pres_atm_everest = 760 * pres_atm_frac(8850)

PAO2_sealevel <- alveolar_PAO2_mmHg(
  PACO2_mmHg = 40,
  Patm_mmHg = 760)
PAO2_summit_resting <- alveolar_PAO2_mmHg(
  PACO2_mmHg = 40, 
  Patm_mmHg = pres_atm_everest,
  PAH2O_mmHg = PAH2O_mmHg_summit)

## ----summitexertion------------------------------------------------------

PACO2_mmHg_Grocott <- 13.3

PAO2_summit_exerted <- alveolar_PAO2_mmHg(
  PACO2_mmHg = PACO2_mmHg_Grocott, 
  Patm_mmHg = pres_atm_everest,
  PAH2O_mmHg = PAH2O_mmHg_summit)

## ----rq------------------------------------------------------------------
rq_lipids <- 0.6
rq_carbs <- 1.0
PAO2_summit_lipids <- alveolar_PAO2_mmHg(
  PACO2_mmHg = PACO2_mmHg_Grocott, 
  Patm_mmHg = pres_atm_everest,
  PAH2O_mmHg = PAH2O_mmHg_summit,
  rq = rq_lipids)
PAO2_summit_carbs <- alveolar_PAO2_mmHg(
  PACO2_mmHg = PACO2_mmHg_Grocott, 
  Patm_mmHg = pres_atm_everest,
  PAH2O_mmHg = PAH2O_mmHg_summit,
  rq = rq_carbs)

## ----plotres, echo=FALSE-------------------------------------------------
results <- c("sea\nlevel" = PAO2_sealevel, 
             "summit\nresting" = PAO2_summit_resting, 
             "summit\nexertion" = PAO2_summit_exerted, 
             "summit\nfatty diet" = PAO2_summit_lipids, 
             "summit\ncarbs diet" = PAO2_summit_carbs)
colours <- c("dark blue", "red", "dark green", "brown", "tan")
barplot(results, 
        col = colours, ylim = c(-10, 100),
        ylab = "PAO2")

