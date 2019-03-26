## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo = TRUE, message = FALSE----------------------------------------
library(processanimateR)
library(dplyr)
library(bupaR)
# Extract only the lacticacid measurements
lactic <- sepsis %>%
    mutate(lacticacid = as.numeric(lacticacid)) %>%
    filter_activity(c("LacticAcid")) %>%
    as.data.frame() %>%
    select("case" = case_id, 
            "time" =  timestamp, 
            value = lacticacid) # format needs to be 'case,time,value'

# Remove the measurement events from the sepsis log
sepsisBase <- sepsis %>%
    filter_activity(c("LacticAcid", "CRP", "Leucocytes", "Return ER",
                      "IV Liquid", "IV Antibiotics"), reverse = T) %>%
    filter_trace_frequency(percentage = 0.95)

# Animate with the secondary data frame `lactic`
animate_process(sepsisBase, 
                mode = "relative", 
                duration = 300,
                legend = "color", 
                mapping = token_aes(color = token_scale(lactic, 
                                                        scale = "linear", 
                                                        range = c("#fff5eb","#7f2704"))))

