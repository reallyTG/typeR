library(MBESS)


### Name: ci.snr
### Title: Confidence Interval for the Signal-To-Noise Ratio
### Aliases: ci.snr
### Keywords: design

### ** Examples


## Bargman (1970) gave an example in which a 5-group ANOVA with 11 subjects in each 
## group is conducted and the observed F value is 11.2213. This example was 
## used in Venables (1975),  Fleishman (1980), and Steiger (2004). If one wants to calculate 
## the exact confidence interval for the signal-to-noise ratio of that example, this
## function can be used.

ci.snr(F.value=11.221, df.1=4, df.2=50, N=55)

ci.snr(F.value=11.221, df.1=4, df.2=50, N=55, conf.level=.90)

ci.snr(F.value=11.221, df.1=4, df.2=50, N=55,  alpha.lower=.02, alpha.upper=.03)



