library(rockchalk)


### Name: gmc
### Title: Group Mean Center: Generate group summaries and individual
###   deviations within groups
### Aliases: gmc

### ** Examples

## Make a data frame out of the state data collection (see ?state)
data(state)
statenew <- as.data.frame(state.x77)
statenew$region <- state.region
statenew$state <- rownames(statenew)
head(statenew.gmc1 <- gmc(statenew, c("Income", "Population"), by = "region"))
head(statenew.gmc2 <- gmc(statenew, c("Income", "Population"), by = "region",
   fulldataframe = FALSE))
## Note dangerous step: assumes row alignment is correct.
## return has rownames from original set to identify danger
head(statenew2 <- cbind(statenew, statenew.gmc2))
if(!all.equal(rownames(statenew), rownames(statenew.gmc2))){
   warning("Data row-alignment probable error")
}
## The following box plots should be identical
boxplot(Income ~ region, statenew.gmc1)
boxplot((Income_mn + Income_dev) ~ region, statenew.gmc1)
## Multiple by variables
fakedat <- data.frame(i = 1:200, j = gl(4, 50), k = gl(20, 10),
                      y1 = rnorm(200), y2 = rnorm(200))
head(gmc(fakedat, "y1", by = "k"), 20)
head(gmc(fakedat, "y1", by = c("j", "k"), fulldataframe = FALSE), 40)
head(gmc(fakedat, c("y1", "y2"), by = c("j", "k"), fulldataframe = FALSE))
## Check missing value management
fakedat[2, "k"] <- NA
fakedat[4, "j"] <- NA##' head(gmc(fakedat, "y1", by = "k"), 20)
head(gmc(fakedat, "y1", by = c("j", "k"), fulldataframe = FALSE), 40)



