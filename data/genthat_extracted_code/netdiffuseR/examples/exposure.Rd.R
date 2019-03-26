library(netdiffuseR)


### Name: exposure
### Title: Ego exposure
### Aliases: exposure
### Keywords: univar

### ** Examples

# Calculating lagged exposure -----------------------------------------------

set.seed(8)
graph <- rdiffnet(20, 4)

expo0 <- exposure(graph)
expo1 <- exposure(graph, lags = 1)

# These should be equivalent
stopifnot(all(expo0[, -4] == expo1[, -1])) # No stop!


# Calculating the exposure based on Structural Equivalence ------------------
set.seed(113132)
graph <- rdiffnet(100, 10)

SE <- lapply(struct_equiv(graph), "[[", "SE")
SE <- lapply(SE, function(x) {
   x <- 1/x
   x[!is.finite(x)] <- 0
   x
})

# Recall setting valued equal to TRUE!
expo_se <- exposure(graph, alt.graph=SE , valued=TRUE)

# These three lines are equivalent to:
expo_se2 <- exposure(graph, alt.graph="se", valued=TRUE)
# Notice that we are setting valued=TRUE, but this is not necesary since when
# alt.graph = "se" the function checks this to be setted equal to TRUE

# Weighted Exposure using degree --------------------------------------------
eDE <- exposure(graph, attrs=dgr(graph))

# Which is equivalent to
graph[["deg"]] <- dgr(graph)
eDE2 <- exposure(graph, attrs="deg")

# Comparing using incoming edges -------------------------------------------
eIN <- exposure(graph, outgoing=FALSE)

# Structral equivalence for different communities ---------------------------
data(medInnovationsDiffNet)

# METHOD 1: Using the c.diffnet method:

# Creating subsets by city
cities <- unique(medInnovationsDiffNet[["city"]])

diffnet <- medInnovationsDiffNet[medInnovationsDiffNet[["city"]] == cities[1]]
diffnet[["expo_se"]] <- exposure(diffnet, alt.graph="se", valued=TRUE)

for (v in cities[-1]) {
   diffnet_v <- medInnovationsDiffNet[medInnovationsDiffNet[["city"]] == v]
   diffnet_v[["expo_se"]] <- exposure(diffnet_v, alt.graph="se", valued=TRUE)
   diffnet <- c(diffnet, diffnet_v)
}

# We can set the original order (just in case) of the data
diffnet <- diffnet[medInnovationsDiffNet$meta$ids]
diffnet

# Checking everything is equal
test <- summary(medInnovationsDiffNet, no.print=TRUE) ==
   summary(diffnet, no.print=TRUE)

stopifnot(all(test[!is.na(test)]))

# METHOD 2: Using the 'groupvar' argument
# Further, we can compare this with using the groupvar
diffnet[["expo_se2"]] <- exposure(diffnet, alt.graph="se",
   groupvar="city", valued=TRUE)

# These should be equivalent
test <- diffnet[["expo_se", as.df=TRUE]] == diffnet[["expo_se2", as.df=TRUE]]
stopifnot(all(test[!is.na(test)]))

# METHOD 3: Computing exposure, rbind and then adding it to the diffnet object
expo_se3 <- NULL
for (v in unique(cities))
   expo_se3 <- rbind(
     expo_se3,
     exposure(
       diffnet[diffnet[["city"]] == v],
       alt.graph = "se", valued=TRUE
     ))

# Just to make sure, we sort the rows
expo_se3 <- expo_se3[diffnet$meta$ids,]

diffnet[["expo_se3"]] <- expo_se3

test <- diffnet[["expo_se", as.df=TRUE]] == diffnet[["expo_se3", as.df=TRUE]]
stopifnot(all(test[!is.na(test)]))


# METHOD 4: Using the groupvar in struct_equiv
se <- struct_equiv(diffnet, groupvar="city")
se <- lapply(se, "[[", "SE")
se <- lapply(se, function(x) {
   x <- 1/x
   x[!is.finite(x)] <- 0
   x
})

diffnet[["expo_se4"]] <- exposure(diffnet, alt.graph=se, valued=TRUE)

test <- diffnet[["expo_se", as.df=TRUE]] == diffnet[["expo_se4", as.df=TRUE]]
stopifnot(all(test[!is.na(test)]))






