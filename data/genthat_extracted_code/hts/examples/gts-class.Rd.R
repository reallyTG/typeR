library(hts)


### Name: gts
### Title: Create a grouped time series
### Aliases: gts print.gts summary.gts is.gts print.gts summary.gts
### Keywords: ts

### ** Examples


# Example 1 illustrating the usage of the "groups" argument
abc <- ts(5 + matrix(sort(rnorm(1600)), ncol = 16, nrow = 100))
sex <- rep(c("female", "male"), each = 8)
state <- rep(c("NSW", "VIC", "QLD", "SA", "WA", "NT", "ACT", "TAS"), 2)
gc <- rbind(sex, state)  # a matrix consists of strings.
gn <- rbind(rep(1:2, each = 8), rep(1:8, 2))  # a numerical matrix
rownames(gc) <- rownames(gn) <- c("Sex", "State")
x <- gts(abc, groups = gc)
y <- gts(abc, groups = gn)

# Example 2 with two simple hierarchies (geography and product) to show the argument "characters"
bnames1 <- c("VICMelbAA", "VICMelbAB", "VICGeelAA", "VICGeelAB",  
             "VICMelbBA", "VICMelbBB", "VICGeelBA", "VICGeelBB",
             "NSWSyndAA", "NSWSyndAB", "NSWWollAA", "NSWWollAB", 
             "NSWSyndBA", "NSWSyndBB", "NSWWollBA", "NSWWollBB")
bts1 <- matrix(ts(rnorm(160)), ncol = 16)
colnames(bts1) <- bnames1
x1 <- gts(bts1, characters = list(c(3, 4), c(1, 1)))

# Example 3 with a non-hierarchical grouped time series of 3 grouping variables (state, age and sex)
bnames2 <- c("VIC1F", "VIC1M", "VIC2F", "VIC2M", "VIC3F", "VIC3M",
             "NSW1F", "NSW1M", "NSW2F", "NSW2M", "NSW3F", "NSW3M")
bts2 <- matrix(ts(rnorm(120)), ncol = 12)
colnames(bts2) <- bnames2
x2 <- gts(bts2, characters = c(3, 1, 1))




