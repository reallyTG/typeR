library(epimdr)


### Name: retrospec
### Title: Function to predict efficacy of outbreak-response vaccination
###   campaign
### Aliases: retrospec

### ** Examples

red1=retrospec(R=1.8, 161, vaccine_efficacy=0.85, target_vaccination=0.5, 
 intervention_length=10, mtime=250, LP=8, IP=5, N=16000)
1-red1$redn



