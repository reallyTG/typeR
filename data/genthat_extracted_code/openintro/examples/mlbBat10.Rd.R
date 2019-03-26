library(openintro)


### Name: mlbBat10
### Title: Major League Baseball Player Hitting Statistics for 2010
### Aliases: mlbBat10
### Keywords: datasets

### ** Examples

data(mlbBat10)
d   <- mlbBat10[mlbBat10$AB > 200,]
pos <- list(c("OF"), c("1B", "2B", "3B", "SS"), "DH", "C")
POS <- c("OF", "IF", "DH", "C")

#=====> On-base Percentage Across Positions <=====#
out <- c()
gp  <- c()
for(i in 1:length(pos)){
	these <- which(d$pos %in% pos[[i]])
	out   <- c(out, d[these,"OBP"])
	gp    <- c(gp, rep(POS[i], length(these)))
}
plot(out ~ as.factor(gp))
summary(lm(out ~ as.factor(gp)))
anova(lm(out ~ as.factor(gp)))

#=====> Batting Average Across Positions <=====#
out <- c()
gp  <- c()
for(i in 1:length(pos)){
	these <- which(d$pos %in% pos[[i]])
	out   <- c(out, d[these,"AVG"])
	gp    <- c(gp, rep(POS[i], length(these)))
}
plot(out ~ as.factor(gp))
summary(lm(out ~ as.factor(gp)))
anova(lm(out ~ as.factor(gp)))

#=====> Home Runs Across Positions <=====#
out <- c()
gp  <- c()
for(i in 1:length(pos)){
	these <- which(d$pos %in% pos[[i]])
	out   <- c(out, d[these,"HR"])
	gp    <- c(gp, rep(POS[i], length(these)))
}
plot(out ~ as.factor(gp))
summary(lm(out ~ as.factor(gp)))
anova(lm(out ~ as.factor(gp)))

#=====> Runs Batted In Across Positions <=====#
out <- c()
gp  <- c()
for(i in 1:length(pos)){
	these <- which(d$pos %in% pos[[i]])
	out   <- c(out, d[these,"RBI"])
	gp    <- c(gp, rep(POS[i], length(these)))
}
plot(out ~ as.factor(gp))
summary(lm(out ~ as.factor(gp)))
anova(lm(out ~ as.factor(gp)))




