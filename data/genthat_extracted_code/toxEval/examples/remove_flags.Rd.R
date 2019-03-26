library(toxEval)


### Name: remove_flags
### Title: Remove endpoints with specific data quality flags from data
### Aliases: remove_flags

### ** Examples

CAS <- c("121-00-6","136-85-6","80-05-7","84-65-1","5436-43-1","126-73-8")
ACC <- get_ACC(CAS)
ACC <- remove_flags(ACC)



