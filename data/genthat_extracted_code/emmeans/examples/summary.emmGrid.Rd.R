library(emmeans)


### Name: summary.emmGrid
### Title: Summaries, predictions, intervals, and tests for 'emmGrid'
###   objects
### Aliases: summary.emmGrid predict.emmGrid as.data.frame.emmGrid
###   [.summary_emm confint.emmGrid test test.emmGrid

### ** Examples

warp.lm <- lm(breaks ~ wool * tension, data = warpbreaks)
warp.emm <- emmeans(warp.lm, ~ tension | wool)
warp.emm    # implicitly runs 'summary'

confint(warp.emm, by = NULL, level = .90)

# --------------------------------------------------------------
pigs.lm <- lm(log(conc) ~ source + factor(percent), data = pigs)
pigs.emm <- emmeans(pigs.lm, "percent", type = "response")
summary(pigs.emm)    # (inherits type = "response")

# For which percents is EMM non-inferior to 35, based on a 10% threshold?
# Note the test is done on the log scale even though we have type = "response"
test(pigs.emm, null = log(35), delta = log(1.10), side = ">")

test(contrast(pigs.emm, "consec"))

test(contrast(pigs.emm, "consec"), joint = TRUE)




