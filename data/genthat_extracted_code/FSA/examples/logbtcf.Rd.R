library(FSA)


### Name: logbtcf
### Title: Constructs the correction-factor used when back-transforming
###   log-transformed values.
### Aliases: logbtcf
### Keywords: manip

### ** Examples

# toy data
df <- data.frame(y=rlnorm(10),x=rlnorm(10))
df$logey <- log(df$y)
df$log10y <- log10(df$y)
df$logex <- log(df$x)
df$log10x <- log10(df$x)

# model and predictions on loge scale
lme <- lm(logey~logex,data=df)
( ploge <- predict(lme,data.frame(logex=log(10))) )
( pe <- exp(ploge) )
( cfe <- logbtcf(lme) )
( cpe <- cfe*pe )

# model and predictions on log10 scale
lm10 <- lm(log10y~log10x,data=df)
plog10 <- predict(lm10,data.frame(log10x=log10(10)))
p10 <- 10^(plog10)
( cf10 <- logbtcf(lm10,10) )
( cp10 <- cf10*p10 )

# cfe and cf10, cpe and cp10 should be equal
all.equal(cfe,cf10)
all.equal(cpe,cp10)




