library(bfw)


### Name: StatsNominal
### Title: Predict Nominal
### Aliases: StatsNominal

### ** Examples

# Use cats data
## No test: 
mcmc <- bfw(project.data = bfw::Cats,
            x = "Reward,Dance,Alignment",
            saved.steps = 50000,
            jags.model = "nominal",
            run.contrasts = TRUE,
            jags.seed = 100)
## End(No test)
# Print only odds-ratio and effect sizes
## No test: 
   mcmc$summary.MCMC[ grep("Odds ratio|Effect",
                       rownames(mcmc$summary.MCMC)) , c(3:7) ]
## End(No test)
#                                                    Mode   ESS    HDIlo     HDIhi    n
# Odds ratio: Food/Affection vs. No/Yes           0.14586 44452  0.11426   0.18982 2000
# Odds ratio: Affection/Food vs. No/Yes           6.49442 44215  5.10392   8.46668 2000
# Effect size: Food/Affection vs. No/Yes         -1.05346 44304 -1.18519  -0.90825 2000
# Effect size: Affection/Food vs. No/Yes          1.05346 44304  0.90825   1.18519 2000
# Odds ratio: Food/Affection vs. Evil/Good        0.77604 45245  0.62328   0.98904 2000
# Odds ratio: Affection/Food vs. Evil/Good        1.25432 45225  0.99311   1.57765 2000
# Effect size: Food/Affection vs. Evil/Good      -0.12844 45222 -0.25510  -0.00115 2000
# Effect size: Affection/Food vs. Evil/Good       0.12844 45222  0.00115   0.25510 2000
# Odds ratio: No/Yes vs. Evil/Good               13.12995 43500 10.58859  16.49207 2000
# Odds ratio: Yes/No vs. Evil/Good                0.07393 43739  0.05909   0.09221 2000
# Effect size: No/Yes vs. Evil/Good               1.43361 43603  1.30715   1.55020 2000
# Effect size: Yes/No vs. Evil/Good              -1.43361 43603 -1.55020  -1.30715 2000
# Odds ratio: Food/Affection vs. No/Yes @ Evil    0.00848 31117  0.00527   0.01336 1299
# Odds ratio: Affection/Food vs. No/Yes @ Evil  104.20109 30523 66.55346 169.12331 1299
# Odds ratio: Food/Affection vs. No/Yes @ Good    2.44193 35397  1.65204   3.63743  701
# Odds ratio: Affection/Food vs. No/Yes @ Good    0.36685 35417  0.25478   0.55982  701
# Effect size: Food/Affection vs. No/Yes @ Evil  -2.58578 30734 -2.85450  -2.35471 1299
# Effect size: Affection/Food vs. No/Yes @ Evil   2.58578 30734  2.35471   2.85450 1299
# Effect size: Food/Affection vs. No/Yes @ Good   0.51934 35316  0.30726   0.73443  701
# Effect size: Affection/Food vs. No/Yes @ Good  -0.51934 35316 -0.73443  -0.30726  701
#
# The results indicate that evil cats are 13.13 times more likely than good cats to decline dancing
# Furthermore, when offered affection, evil cats are 104.20 times more likely to decline dancing,
# relative to evil cats that are offered food.



