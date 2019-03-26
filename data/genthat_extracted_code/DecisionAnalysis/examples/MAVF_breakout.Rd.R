library(DecisionAnalysis)


### Name: MAVF_breakout
### Title: Multiple Attribute Value Function (MAVF) Breakout
### Aliases: MAVF_breakout

### ** Examples


qbdata <- NFLcombine[1:7,]

Height <- SAVF_exp_score(qbdata$heightinchestotal, 68, 75.21, 82)
Weight <- SAVF_exp_score(qbdata$weight, 185, 224.34, 275)
Forty <- SAVF_exp_score(qbdata$fortyyd, 4.3, 4.81, 5.4, increasing=FALSE)
Shuttle <- SAVF_exp_score(qbdata$twentyss, 3.8, 4.3, 4.9, increasing=FALSE)
Vertical <- SAVF_exp_score(qbdata$vertical, 21, 32.04, 40)
Broad <- SAVF_exp_score(qbdata$broad, 90, 111.24, 130)
Wonderlic <- SAVF_exp_score(qbdata$wonderlic, 0, 27.08, 50)

SAVF_matrix = cbind(Height, Weight, Forty, Shuttle, 
                 Vertical, Broad, Wonderlic)
weights = c(0.096, 0.224, 0.092, 0.138, 0.152, 0.228, 0.07)

MAVF_breakout(SAVF_matrix, weights, qbdata$name)




