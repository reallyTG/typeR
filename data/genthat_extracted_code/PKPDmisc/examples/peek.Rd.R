library(PKPDmisc)


### Name: peek
### Title: peek at the results in a dplyr pipeline
### Aliases: peek

### ** Examples

library(dplyr)
Theoph %>% select(Subject, Time, conc) %>% peek %>% group_by(Subject) %>% 
summarize(cmax = max(conc)) 

Theoph %>% select(Subject, Time, conc) %>% peek(message = "after select") %>% 
 group_by(Subject) %>% 
summarize(cmax = max(conc)) 

# nice for saving full objects but still seeing their output
cmax_theoph <- Theoph %>% select(Subject, Time, conc) %>% 
peek(message = "after select") %>% 
 group_by(Subject) %>% 
summarize(cmax = max(conc)) %>% peek 
cmax_theoph # still saves full output



