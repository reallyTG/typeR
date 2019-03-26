library(PROSPER)


### Name: quanti
### Title: Step by step: the model develops driven by field data
### Aliases: quanti

### ** Examples

#loads the example data for Echinochloa crus-galli
data(param.ECHCG)
param.weed <- param.ECHCG
#how many seeds (natural, not log-scale) prodused by 100 plants in a corn stand on 100 area units?
quanti(origin=100, step_name="seed_prod_first", crop="corn",  proportion=FALSE,
                 area=100, log_values=FALSE, back_log=FALSE)
rm(param.ECHCG)



