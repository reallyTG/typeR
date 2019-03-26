library(samplingbook)


### Name: Sprop
### Title: Sampling Proportion Estimation
### Aliases: Sprop

### ** Examples

# 1) Survey in company to upgrade office climate
Sprop(m=45, n=100, N=300)
Sprop(m=2, n=100, N=300)

# 2) German opinion poll for 03/07/09 with 
# (http://www.wahlrecht.de/umfragen/politbarometer.htm)
# a) 302 of 1206 respondents who would elect SPD.
# b) 133 of 1206 respondents who would elect the Greens.
Sprop(m=302, n=1206, N=Inf)
Sprop(m=133, n=1206, N=Inf)

# 3) Rare disease of animals (sample size n=500 of N=10.000 animals, one infection)
# for 95% one sided confidence level use level=0.9
Sprop(m=1, n=500, N=10000, level=0.9)

# 4) call with data vector y
y <- c(0,0,1,0,1,0,0,0,1,1,0,0,1)
Sprop(y=y, N=200)
# is the same as
Sprop(m=5, n=13, N=200)



