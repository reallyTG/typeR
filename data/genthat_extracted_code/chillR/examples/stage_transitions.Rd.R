library(chillR)


### Name: stage_transitions
### Title: Compute what it takes to advance through development stages
### Aliases: stage_transitions
### Keywords: stage transitions

### ** Examples

hourtemps<-stack_hourly_temps(KA_weather)
observations<-data.frame(Stage=c("V1","V2","V3","V1","V2","V3","V1","V3"),
                        Season=c(2001,2001,2001,2002,2002,2002,2003,2003),
                        Year=c(2001,2001,2001,2002,2002,2002,2003,2003),
                        JDay=c(30,45,60,35,42,55,37,62))
stages<-c("V1","V2","V3") 

stage_transitions(observations,hourtemps,stages)




