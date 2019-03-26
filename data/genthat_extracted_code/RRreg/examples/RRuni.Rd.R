library(RRreg)


### Name: RRuni
### Title: Univariate analysis of randomized response data
### Aliases: RRuni

### ** Examples

# Generate responses of 1000 people according to Warner's model
# with an underlying true proportion of .3
genData <- RRgen(n=1000, pi=.3, model="Warner", p=.7)
# Analyse univariate data to estimate 'pi'
analyse <- RRuni(response=genData$response, model="Warner", p=.7)
summary(analyse)

# Generate data in line with the Stochastic Lie Detector 
# assuming that 90% of the respondents answer truthfully
genData2 <- RRgen(n=1000, pi=.3, model="SLD", p=c(.2,.8), 
                  complyRates=c(.8,1),groupRatio=0.4)
analyse2 <- RRuni(response=genData2$response, model="SLD", 
                  p=c(.2,.8), group=genData2$group)
summary(analyse2)



