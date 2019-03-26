## ------------------------------------------------------------------------
setwd(getwd()) # this should be replaced by the folder where the wildfire_input_table.csv
#file it stored
format(read.csv("wildfire_input_table.csv")[,1:5],scientific=FALSE)

## ----include=FALSE-------------------------------------------------------
library(decisionSupport)
make_variables<-function(est,n=1)
{ x<-random(rho=est, n=n)
    for(i in colnames(x)) assign(i,
     as.numeric(x[1,i]),envir=.GlobalEnv)
}

make_variables(estimate_read_csv("wildfire_input_table.csv"))

## ------------------------------------------------------------------------
Fire <- chance_event(fire_risk, value_if = 1, n = n_years)

## ------------------------------------------------------------------------
Controlled <- as.numeric(1:n_years %% controlled_burning_frequency==0)

## ------------------------------------------------------------------------
sim.fire <- data.frame(Year=1:n_years, Fire, Controlled)
sim.fire


## ------------------------------------------------------------------------
no.control <- data.frame(Year = integer(), 
                         Biomass = double(), 
                         FireType = character(),
                         stringsAsFactors = F)

control <- data.frame(Year = integer(), 
                      Biomass = double(), 
                      FireType = character(),
                      stringsAsFactors = F)

## ------------------------------------------------------------------------
  #start of year loop
  for (y in 1:n_years) {
    
    # record year
    control[y, "Year"] <- y
    
    # calculate biomass
    if (y == 1) {control[y, "Biomass"] <- initial_biomass} else {
      
      switch(EXPR = control[y - 1, "FireType"], 
             "Controlled" = {control[y, "Biomass"] <- biomass_after_burning * 
               (1 + bio_accu_rate_contr_burn/100)},
             "None" = {control[y, "Biomass"] <- control[y - 1, "Biomass"] * 
               (1 + bio_accu_rate_no_contr_burn/100)},
             "Severe" = {control[y, "Biomass"] <- biomass_after_severe_fire},
             "Mild" = {control[y, "Biomass"] <- biomass_after_mild_fire})}  
    
    # determine wild fire type
    ifelse(test = sim.fire[y,"Controlled"] == 1, 
           yes = control[y,"FireType"] <- "Controlled",
           no = ifelse(test = sim.fire[y,"Fire"] == 0,
                yes = control[y,"FireType"] <- "None",
                no = ifelse(test = sim.fire[y,"Fire"] == 1 && control[y,"Biomass"] > severity_threshold,
                     yes = control[y,"FireType"] <-  "Severe",
                     no = control[y,"FireType"] <-  "Mild")))
     
    
  } #end of year loop controlled burning scenario


## ------------------------------------------------------------------------
  #start of year loop
  for (y in 1:n_years) {
    
    # record year
    no.control[y, "Year"] <- y
    
    # calculate biomass
    if (y == 1) {no.control[y, "Biomass"] <- initial_biomass} else {
      
      switch(EXPR = no.control[y - 1, "FireType"], 
             "None" = {no.control[y, "Biomass"] <- no.control[y - 1, "Biomass"] * 
                     (1 + bio_accu_rate_no_contr_burn/100)},
             "Severe" = {no.control[y, "Biomass"] <- biomass_after_severe_fire},
             "Mild" = {no.control[y, "Biomass"] <- biomass_after_mild_fire})
      }  
      
    # determine fire type
    ifelse(test = sim.fire[y,"Fire"] == 0,
           yes = no.control[y,"FireType"] <- "None",
           no = ifelse(
             test = no.control[y,"Biomass"] > severity_threshold,
             yes = no.control[y,"FireType"] <-  "Severe",
             no =  no.control[y,"FireType"] <-  "Mild"))

  } #end of year loop 'no burn' scenario


## ------------------------------------------------------------------------
control
no.control

## ------------------------------------------------------------------------

# calculate costs of no.control treatment -------------------------
  
  ff.cost.no.control <-
     (no.control$FireType == "Severe") * fire_fighting_cost_severe_fire +
     (no.control$FireType == "Mild") * fire_fighting_cost_mild_fire
  
  env.cost.no.control <-
     (no.control$FireType == "Severe") * env_imp_severe_fire + 
     (no.control$FireType == "Mild") * env_imp_mild_fire
  
  bottomline_no_burn <- - ( ff.cost.no.control + env.cost.no.control) * area_size
  
# calculate costs of control treatment
  
  treatment.cost.control <-
     (control$FireType == "Controlled") * cost_of_controlled_burning
  
  ff.cost.control <-
     (control$FireType == "Severe") * fire_fighting_cost_severe_fire +
     (control$FireType == "Mild") * fire_fighting_cost_mild_fire
  
  env.cost.control <-
     (control$FireType == "Severe") * env_imp_severe_fire + 
     (control$FireType == "Mild") * env_imp_mild_fire

  bottomline_contr_burn <-
      - (treatment.cost.control + ff.cost.control + env.cost.control) * area_size
 


## ------------------------------------------------------------------------
benefit_of_controlled_burning <- bottomline_contr_burn - bottomline_no_burn

## ------------------------------------------------------------------------
bottomline_no_burn
bottomline_contr_burn
benefit_of_controlled_burning

## ------------------------------------------------------------------------
discount(c(rep(100,10)),discount_rate = 4)

## ------------------------------------------------------------------------
discount(c(rep(100,10)),discount_rate=4,calculate_NPV = TRUE)

## ------------------------------------------------------------------------
NPV_controlled_burning <- discount(benefit_of_controlled_burning,
                                     discount_rate = discount_rate,
                                     calculate_NPV = TRUE)

## ------------------------------------------------------------------------
burn.sim <- function(){

  # set up dataframe to store simulation fire conditions
  Fire <- chance_event(fire_risk, value_if = 1,n = n_years) 
  Controlled <-  as.numeric(1:n_years %% controlled_burning_frequency==0)
  sim.fire <- data.frame(1:n_years, Fire, Controlled)
  
# --- 'no controlled burn' scenario ----------------------------
  
  # set up dataframe to store results
  no.control <- data.frame(Year = integer(), 
                           Biomass = double(), 
                           FireType = character(),
                           stringsAsFactors = F)
  #start of year loop
  for (y in 1:n_years) {
    
    # record year
    no.control[y, "Year"] <- y
    
    # calculate biomass
    if (y == 1) {no.control[y, "Biomass"] <- initial_biomass} else {
      
      switch(EXPR = no.control[y - 1, "FireType"], 
             "None" = {no.control[y, "Biomass"] <- no.control[y - 1, "Biomass"] * 
                     (1 + bio_accu_rate_no_contr_burn/100)},
             "Severe" = {no.control[y, "Biomass"] <- biomass_after_severe_fire},
             "Mild" = {no.control[y, "Biomass"] <- biomass_after_mild_fire})
      }  
      
    # determine fire type
    ifelse(test = sim.fire[y,"Fire"] == 0,
           yes = no.control[y,"FireType"] <- "None",
           no = ifelse(
             test = no.control[y,"Biomass"] > severity_threshold,
             yes = no.control[y,"FireType"] <-  "Severe",
             no =  no.control[y,"FireType"] <-  "Mild"))

  } #end of year loop 'no burn' scenario
    
# ---  controlled burning scenario ---------------------------
  
  # set up dataframe to store results
  control <- data.frame(Year = integer(), 
             Biomass = double(), 
             FireType = character(),
             stringsAsFactors = F)
  
  #start of year loop
  for (y in 1:n_years) {
    
    # record year
    control[y, "Year"] <- y
    
    # calculate biomass
    if (y == 1) {control[y, "Biomass"] <- initial_biomass} else {
      
      switch(EXPR = control[y - 1, "FireType"], 
             "Controlled" = {control[y, "Biomass"] <- biomass_after_burning * 
               (1 + bio_accu_rate_contr_burn/100)},
             "None" = {control[y, "Biomass"] <- control[y - 1, "Biomass"] * 
               (1 + bio_accu_rate_no_contr_burn/100)},
             "Severe" = {control[y, "Biomass"] <- biomass_after_severe_fire},
             "Mild" = {control[y, "Biomass"] <- biomass_after_mild_fire})}  
    
    # determine wild fire type
    ifelse(test = sim.fire[y,"Controlled"] == 1, 
           yes = control[y,"FireType"] <- "Controlled",
           no = ifelse(test = sim.fire[y,"Fire"] == 0,
                yes = control[y,"FireType"] <- "None",
                no = ifelse(test = sim.fire[y,"Fire"] == 1 && control[y,"Biomass"] > severity_threshold,
                     yes = control[y,"FireType"] <-  "Severe",
                     no = control[y,"FireType"] <-  "Mild")))
     
    
  } #end of year loop controlled burning scenario
  
# calculate costs of no.control treatment -------------------------
  
  ff.cost.no.control <- (no.control$FireType == "Severe") * fire_fighting_cost_severe_fire +
                        (no.control$FireType == "Mild") * fire_fighting_cost_mild_fire
  
  env.cost.no.control <- (no.control$FireType == "Severe") * env_imp_severe_fire + 
                         (no.control$FireType == "Mild") * env_imp_mild_fire
  
  bottomline_no_burn <- - ( ff.cost.no.control + env.cost.no.control) * area_size
  
# calculate costs of control treatment
  
  treatment.cost.control <- (control$FireType == "Controlled") * cost_of_controlled_burning
  
  ff.cost.control <- (control$FireType == "Severe") * fire_fighting_cost_severe_fire +
                     (control$FireType == "Mild") * fire_fighting_cost_mild_fire
  
  env.cost.control <- (control$FireType == "Severe") * env_imp_severe_fire + 
                      (control$FireType == "Mild") * env_imp_mild_fire
 
  bottomline_contr_burn <- - (treatment.cost.control + ff.cost.control + env.cost.control) * area_size
  
# return key results
  
  # calculate the benefit of controlled burning over no controlled burning
  benefit_of_controlled_burning <- (bottomline_contr_burn - bottomline_no_burn)
  
  #calculate the Net Present Value (NPV) for forest management with controlled burning
  NPV_controlled_burning <- discount(benefit_of_controlled_burning,
                                     discount_rate = discount_rate,
                                     calculate_NPV = TRUE)
  
  return(list(NPV_controlled_burning = NPV_controlled_burning))

} # end of function


## ----include=FALSE-------------------------------------------------------
mcSummary<-read.csv("MCResults/mcSummary.csv")

## ------------------------------------------------------------------------
read.csv("MCResults/mcSummary.csv")

## ------------------------------------------------------------------------
read.csv("MCResults/welfareDecisionSummary.csv")

