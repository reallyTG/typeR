library(epiR)


### Name: epi.pooled
### Title: Estimate herd test characteristics when pooled sampling is used
### Aliases: epi.pooled
### Keywords: univar univar

### ** Examples

## We want to test dairy herds for Johne's disease using faecal culture 
## which has a sensitivity and specificity of 0.647 and 0.981, respectively. 
## Suppose we pool faecal samples from five cows together and use six pooled 
## samples per herd. What is the herd level sensitivity and specificity 
## based on this approach (assuming homogenous mixing)? 

epi.pooled(se = 0.647, sp = 0.981, P = 0.12, m = 5 , r = 6)

## Herd level sensitivity is 0.927, herd level specificity is 0.562. 
## Sensitivity at the herd level is increased using the pooled sampling 
## approach; herd level specificity is decreased. 



