## ---- results="hide"-----------------------------------------------------
library(dplyr)
library(purrr)
library(stringr)
library(fbar)

## ------------------------------------------------------------------------
data("ecoli_core")
model <- ecoli_core %>%
  mutate(geneAssociation = geneAssociation %>%
           str_replace_all('and','&') %>%
           str_replace_all('or','|'))

genes_in_model <- model$geneAssociation %>%
  str_split('[()|& ]+') %>%
  flatten_chr() %>%
  discard(is.na) %>%
  discard(~ str_length(.x)==0)

## ------------------------------------------------------------------------
evaluation_function <- function(genome){
  
  res <- model %>%
    mutate(activation = gene_eval(geneAssociation, names(genome), genome),
           activation = coalesce(activation, 1),
           uppbnd = uppbnd*activation,
           lowbnd = lowbnd*activation) %>%
    find_fluxes_df(do_minimization = FALSE) %>%
    mutate(lowbnd = ifelse(abbreviation=='BIOMASS_Ecoli_core_w_GAM', flux*0.99, lowbnd),
           uppbnd = ifelse(abbreviation=='BIOMASS_Ecoli_core_w_GAM', flux*1.01, uppbnd),
           obj_coef = 1*(abbreviation=='EX_ac_e')) %>%
    find_fluxes_df(do_minimization = FALSE)
  
  return(list(bm = filter(res, abbreviation=='BIOMASS_Ecoli_core_w_GAM')$flux, 
              synth = filter(res, abbreviation=='EX_ac_e')$flux))
}

## ------------------------------------------------------------------------
non_dom_sort <- function(input){
  input_long <- input %>%
    gather(property, value, -id) %>%
    mutate(front=NA)
  
  currentfront <- 1
  
  while(any(is.na(input_long$front))){
    
    input_long <- input_long %>%
      inner_join(.,., by='property') %>%
      group_by(id.x,id.y) %>%
      mutate(dominance = ifelse(all(value.x>=value.y), 
                                'xdomy', 
                                ifelse(all(value.y>=value.x), 
                                       'ydomx', 
                                       'nondom'
                                       )
                                )
      ) %>%
      group_by(id.x) %>%
      mutate(front = ifelse(all(dominance[is.na(front.y)] %in% c('xdomy', 'nondom')), 
                            pmin(currentfront, front.x, na.rm=TRUE), 
                            NA
                            )
      ) %>%
      group_by(id = id.x, property = property, front, value = value.x) %>%
      summarise()
    
    currentfront <- currentfront + 1
  }
  
  return(
    input_long %>%
      spread(property, value)
  )
  
}

## ------------------------------------------------------------------------
crowding_distance <- function(input){
  return(
    input %>%
      gather(property, value, -id, -front) %>%
      group_by(front, property) %>%
      arrange(value) %>%
      mutate(crowding = (lead(value)-lag(value))/(max(value)-min(value)),
             crowding = ifelse(is.na(crowding),Inf, crowding)) %>%
      group_by(id) %>%
      mutate(crowding = sum(crowding)) %>%
      spread(property, value)
  )
}

## ---- eval=FALSE---------------------------------------------------------
#  start_genome <- set_names(rep_along(genes_in_model, TRUE), genes_in_model)
#  pop <- list(start_genome)
#  
#  popsize = 50
#  
#  for(i in 1:50){
#    results <- map_df(pop, evaluation_function) %>% # Evaluate all the genomes
#      mutate(bm=signif(bm), synth=signif(synth)) %>% # Round results
#      unique() %>% # Throw away duplicates
#      mutate(id = 1:n()) %>% # label the results
#      sample_frac() %>% # Shuffle
#      non_dom_sort() %>% # Find the non-dominated fronts
#      crowding_distance %>% # Find the crowding distances
#      arrange(front, desc(crowding)) # Sort by front, breaking ties by crowding distance
#  
#    selected <- results %>%
#      filter(row_number() <= popsize/2) %>% # Keep the best half of the population
#      getElement('id')
#  
#    kept_pop <- pop[selected]
#    altered_pop <- kept_pop %>%
#      sample(popsize-length(selected), TRUE) %>% # Select a random portion of the population as parents
#      map(function(genome){xor(genome, runif(length(genome))>0.98)}) # Mutate a small number of genes from the parent population.
#  
#    pop <- unique(c(kept_pop, altered_pop)) # Combine the ofspring and parent populations
#  }

## ---- eval=FALSE---------------------------------------------------------
#  library(ggplot2)
#  
#  results %>%
#    filter(front==1) %>%
#    ggplot(aes(x=bm, y=synth, colour=front)) +
#    geom_point() +
#    geom_step(direction='vh') +
#    scale_x_log10() +
#    scale_y_log10() +
#    theme_bw()

