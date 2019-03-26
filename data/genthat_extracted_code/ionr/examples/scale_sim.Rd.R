library(ionr)


### Name: scale_sim
### Title: Simulate personality scale(s) and an outcome
### Aliases: scale_sim

### ** Examples

## Create a scale-outcome set that violates ION. Only 2 indicators out of 8 relate
## to the outcome, the others just relate to the 2 indicators This setting is similar
## to the N5: Impulsiveness - BMI association in Vainik et al (2015) EJP paper.
set.seed(466)
a<-scale_sim(n=2500, to_n=2, tn_n=6)
# Last 2 indicators have considerably higher correlation with the outcome
cor(a[[1]],a[[2]])

## Create a scale-outcome set that has ION, all 8 indicators relate to the outcome
set.seed(466)
b<-scale_sim(n=2500, to_n=8)
# All indicators correlate largely on the same level with the outcome.
cor(b[[1]],b[[2]])

## Create a scale-outcome set that violates ION - only 1 indicator relates to
##the outcome. Include other-report.
set.seed(466)
c<-scale_sim(n=2500, to_n=1, tn_n=7, indicators2=TRUE)
# Last 2 indicators have considerably higher correlation with the outcome
cor(c[[1]],c[[2]])
cor(c[[3]],c[[2]])



