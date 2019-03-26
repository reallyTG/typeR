library(Momocs)


### Name: reLDA
### Title: "Redo" a LDA on new data
### Aliases: reLDA reLDA.default reLDA.PCA reLDA.Coe

### ** Examples

# We select the first 10 individuals in bot,
# for whisky and beer bottles. It will be our referential.
bot1   <- slice(bot, c(1:10, 21:30))
# Same thing for the other 10 individuals.
# It will be our unknown dataset on which we want
# to calculate classes.
bot2   <- slice(bot, c(11:20, 31:40))

# We calculate efourier on these two datasets
bot1.f <- efourier(bot1, 8)
bot2.f <- efourier(bot2, 8)

# Here we obtain our LDA model: first, a PCA, then a LDA
bot1.p <- PCA(bot1.f)
bot1.l <- LDA(bot1.p, "type")

# we redo the same PCA since we worked with scores
bot2.p <- rePCA(bot1.p, bot2.f)

# we finally "predict" with the model obtained before
bot2.l <- reLDA(bot2.p, bot1.l)
bot2.l




