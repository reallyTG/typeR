library(gemtc)


### Name: rank.probability
### Title: Calculating rank-probabilities
### Aliases: rank.probability print.mtc.rank.probability
###   plot.mtc.rank.probability

### ** Examples

model <- mtc.model(smoking)
# To save computation time we load the samples instead of running the model
## Not run: results <- mtc.run(model)
results <- dget(system.file("extdata/luades-smoking.samples.gz", package="gemtc"))

ranks <- rank.probability(results)
print(ranks)
## Rank probability; preferred direction = 1
##       [,1]     [,2]     [,3]     [,4]
## A 0.000000 0.003000 0.105125 0.891875
## B 0.057875 0.175875 0.661500 0.104750
## C 0.228250 0.600500 0.170875 0.000375
## D 0.713875 0.220625 0.062500 0.003000

plot(ranks) # plot a cumulative rank plot
plot(ranks, beside=TRUE) # plot a 'rankogram'



