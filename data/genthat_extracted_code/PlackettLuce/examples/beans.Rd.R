library(PlackettLuce)


### Name: beans
### Title: Preferred Bean Varieties in Nicaragua
### Aliases: beans
### Keywords: datasets

### ** Examples


# Consider the best and worst rankings. These give the variety the
# farmer thought was best or worst, coded as A, B or C for the
# first, second or third variety assigned to the farmer
# respectively.
data(beans)
head(beans[c("best", "worst")], 2)

# Convert these to numeric values, allowing us to impute the
# middle-ranked variety (a strict ranking is assumed here, so the
# sum of each row should be 6)
beans <- within(beans, {
   best <- match(best, c("A", "B", "C"))
   worst <- match(worst, c("A", "B", "C"))
   middle <- 6 - best - worst
})
head(beans[c("best", "middle", "worst")], 2)

# This gives an ordering of the three varieties the farmer was
# given. The names of these varieties are stored in separate
# columns
varieties <- as.matrix(beans[c("variety_a", "variety_b", "variety_c")])
head(varieties, 2)

# So we can convert the variety IDs to the variety names
n <- nrow(beans)
beans <- within(beans, {
    best <- varieties[cbind(seq_len(n), best)]
    worst <- varieties[cbind(seq_len(n), worst)]
    middle <- varieties[cbind(seq_len(n), middle)]
})
head(beans[c("best", "middle", "worst")], 2)

# Create a rankings object from the rankings of order three
## each ranking is a sub-ranking of three varieties from the full set
lab <- c("Local", sort(unique(as.vector(varieties))))
R <- as.rankings(beans[c("best", "middle", "worst")],
                 input = "ordering", labels = lab)
head(R)

# Convert worse/better columns to ordered pairs
head(beans[c("var_a", "var_b", "var_c")], 2)
paired <- list()
for (id in c("a", "b", "c")){
    ordering <- matrix("Local", nrow = n, ncol = 2)
    worse <- beans[[paste0("var_", id)]] == "Worse"
    ## put trial variety in column 1 when it is not worse than local
    ordering[!worse, 1] <- beans[[paste0("variety_", id)]][!worse]
    ## put trial variety in column 2 when it is worse than local
    ordering[worse, 2] <- beans[[paste0("variety_", id)]][worse]
    paired[[id]] <- ordering
}
head(paired[["a"]])

# Convert orderings to sub-rankings of full set and combine all rankings
paired <- lapply(paired, as.rankings, input = "ordering", labels = lab)
R <- rbind(R, paired[["a"]], paired[["b"]], paired[["c"]])
head(R)
tail(R)



