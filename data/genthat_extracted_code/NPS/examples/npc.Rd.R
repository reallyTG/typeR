library(NPS)


### Name: npc
### Title: Create Net Promoter Categories from Likelihood to Recommend
###   Scores
### Aliases: npc

### ** Examples

# The command below will generate Net Promoter categories for each point
# on a standard 0:10 Likelihood to Recommend scale
npc(0:10)

 # Here's how scores and categories map out. Notice that scores which are
 # 'off the scale' drop out as missing/invalid
data.frame(score = -2:12, category = npc(-2:12))

# When you have lots of data, summaries are useful
rec <- sample(0:10, prob=c(0.02, 0.01, 0.01, 0.01, 0.01, 0.03, 0.03, 0.09,
    0.22, 0.22, 0.35), 1000, replace=TRUE)

# A Histrogram of the Likelihood to Recommend scores we just generated
hist(rec, breaks=-1:10)

# A look at the by nps category using summary
summary(npc(rec))

# As above
table(npc(rec))

# As a crosstabulation
table(rec, npc(rec))

nps(rec)



