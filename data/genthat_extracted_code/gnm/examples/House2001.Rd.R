library(gnm)


### Name: House2001
### Title: Data on twenty roll calls in the US House of Representatives,
###   2001
### Aliases: House2001
### Keywords: datasets

### ** Examples

## Not run: 
##D ## This example takes some time to run!
##D summary(House2001)
##D ## Put the votes in a matrix, and discard members with too many NAs etc:
##D House2001m <- as.matrix(House2001[-1])
##D informative <- apply(House2001m, 1, function(row){
##D     valid <- !is.na(row)
##D     validSum <- if (any(valid)) sum(row[valid]) else 0
##D     nValid <- sum(valid)
##D     uninformative <- (validSum == nValid) || (validSum == 0) || (nValid < 10)
##D     !uninformative})
##D House2001m <- House2001m[informative, ]
##D ## Make a vector of colours, blue for Republican and red for Democrat:
##D parties <- House2001$party[informative]
##D partyColors <- rep("black", length(parties))
##D partyColors <- ifelse(parties == "D", "red", partyColors)
##D partyColors <- ifelse(parties == "R", "blue", partyColors)
##D ## Expand the data for statistical modelling:
##D House2001v <- as.vector(House2001m)
##D House2001f <- data.frame(member = rownames(House2001m),
##D                          party = parties,
##D                          rollCall = factor(rep((1:20),
##D                                            rep(nrow(House2001m), 20))),
##D                          vote = House2001v)
##D ## Now fit an "empty" model, in which all members vote identically:
##D baseModel <- glm(vote ~ -1 + rollCall, family = binomial, data = House2001f)
##D ## From this, get starting values for a one-dimensional multiplicative term:
##D Start <- residSVD(baseModel, rollCall, member)
##D ##
##D ## Now fit the logistic model with one multiplicative term.
##D ## For the response variable, instead of vote=0,1 we use 0.03 and 0.97,
##D ## corresponding approximately to a bias-reducing adjustment of p/(2n),
##D ## where p is the number of parameters and n the number of observations.
##D ##
##D voteAdj <- 0.5 + 0.94*(House2001f$vote - 0.5)
##D House2001model1 <- gnm(voteAdj ~ Mult(rollCall, member),
##D               eliminate = rollCall,
##D               family = binomial, data = House2001f,
##D               na.action = na.exclude, trace = TRUE, tolerance = 1e-03,
##D               start = -Start)
##D ## Deviance is 2234.847, df = 5574
##D ##
##D ## Plot the members' positions as estimated in the model:
##D ##
##D memberParameters <- pickCoef(House2001model1, "member")
##D plot(coef(House2001model1)[memberParameters], col = partyColors,
##D      xlab = "Alphabetical index (Abercrombie 1 to Young 301)",
##D      ylab = "Member's relative position, one-dimensional model")
##D ## Can do the same thing with two dimensions, but gnm takes around 40
##D ## slow iterations to converge (there are more than 600 parameters): 
##D Start2 <- residSVD(baseModel, rollCall, member, d = 2)
##D House2001model2 <- gnm(
##D               voteAdj ~ instances(Mult(rollCall - 1, member - 1), 2),
##D               eliminate = rollCall,
##D               family = binomial, data = House2001f,
##D               na.action = na.exclude, trace = TRUE, tolerance = 1e-03,
##D               start = Start2, lsMethod = "qr")
##D ## Deviance is 1545.166, df = 5257
##D ##
##D memberParameters1 <- pickCoef(House2001model2, "1).member")
##D memberParameters2 <- pickCoef(House2001model2, "2).member")
##D plot(coef(House2001model2)[memberParameters1],
##D      coef(House2001model2)[memberParameters2],
##D      col = partyColors,
##D      xlab = "Dimension 1",
##D      ylab = "Dimension 2",
##D      main = "House2001 data: Member positions, 2-dimensional model")
##D ##
##D ## The second dimension is mainly due to rollCall 12, which does not
##D ## correlate well with the rest -- look at the coefficients of
##D ## House2001model1, or at the 12th row of
##D cormat <- cor(na.omit(House2001m))
## End(Not run)



