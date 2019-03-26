library(AnnuityRIR)


### Name: PV_post_mood_pm
### Title: Compute the present expected value of an n-payment annuity, with
###   payments of 1 unit each made at the end of every year
###   (annuity-immediate), valued at the rate X, with the method of Mood
###   _et al._ using some positive moments of the distribution.
### Aliases: PV_post_mood_pm

### ** Examples

#example 1
data=c(0.298,0.255,0.212,0.180,0.165,0.163,0.167,0.161,0.154,
0.128,0.079,0.059,0.042,-0.008,-0.012,-0.002)
PV_post_mood_pm(data)

# example 2
data<-rnorm(n=30,m=0.03,sd=0.01)
PV_post_mood_pm(data)

# example 3
data = c(1.77,1.85,1.85,1.84,1.84,1.83,1.85,1.85,1.88,1.85,1.80,1.84,1.91,1.85,1.84,1.85,
1.86,1.85,1.88,1.86)
data=data/100
PV_post_mood_pm(data)



