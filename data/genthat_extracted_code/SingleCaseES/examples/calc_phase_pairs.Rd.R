library(SingleCaseES)


### Name: calc_phase_pairs
### Title: Calculate phase pair numbers
### Aliases: calc_phase_pairs

### ** Examples

x <- rep(c("A","B","C","B","C","A","C"), c(4:10))
calc_phase_pairs(x)

library(dplyr)
Schmidt2007 %>% 
  group_by(Behavior_type, Case_pseudonym) %>%
  mutate(phase_pair = calc_phase_pairs(Condition))




