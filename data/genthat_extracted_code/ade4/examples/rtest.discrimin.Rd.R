library(ade4)


### Name: rtest.discrimin
### Title: Monte-Carlo Test on a Discriminant Analysis (in R).
### Aliases: rtest.discrimin
### Keywords: multivariate nonparametric

### ** Examples

data(meaudret)
pca1 <- dudi.pca(meaudret$env, scan = FALSE, nf = 3)
rand1 <- rtest(discrimin(pca1, meaudret$design$season, scan = FALSE), 99)
rand1
#Monte-Carlo test
#Observation: 0.3035 
#Call: as.rtest(sim = sim, obs = obs)
#Based on 999 replicates
#Simulated p-value: 0.001 
plot(rand1, main = "Monte-Carlo test")
summary.manova(manova(as.matrix(meaudret$env)~meaudret$design$season), "Pillai")
#                         Df Pillai approx F num Df den Df  Pr(>F)    
# meaudret$design$season  3   2.73    11.30     27     30 1.6e-09 ***
# Residuals         16                                          
# ---
# Signif. codes:  0 `***' 0.001 `**' 0.01 `*' 0.05 `.' 0.1 ` ' 1 
# 2.731/9 = 0.3034



