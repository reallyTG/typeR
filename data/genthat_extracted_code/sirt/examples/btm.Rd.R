library(sirt)


### Name: btm
### Title: Extended Bradley-Terry Model
### Aliases: btm summary.btm
### Keywords: Bradley-Terry model summary

### ** Examples

#############################################################################
# EXAMPLE 1: Bradley-Terry model | data.pw01
#############################################################################

data(data.pw01)

dat <- data.pw01
dat <- dat[, c("home_team", "away_team", "result") ]

# recode results according to needed input
dat$result[ dat$result==0 ] <- 1/2   # code for ties
dat$result[ dat$result==2 ] <- 0     # code for victory of away team

#********************
# Model 1: Estimation with ties and home advantage
mod1 <- sirt::btm( dat)
summary(mod1)

## Not run: 
##D #********************
##D # Model 2: Estimation with ties, no epsilon adjustment
##D mod2 <- sirt::btm( dat, eps=0, fix.eta=0)
##D summary(mod2)
##D 
##D #********************
##D # Model 3: Some fixed abilities
##D fix.theta <- c("Anhalt Dessau"=-1 )
##D mod3 <- sirt::btm( dat, eps=0, fix.theta=fix.theta)
##D summary(mod3)
##D 
##D #********************
##D # Model 4: Ignoring ties, no home advantage effect
##D mod4 <- sirt::btm( dat, ignore.ties=TRUE, fix.eta=0)
##D summary(mod4)
##D 
##D #********************
##D # Model 5: Ignoring ties, no home advantage effect (JML approach -> eps=0)
##D mod5 <- sirt::btm( dat, ignore.ties=TRUE, fix.eta=0, eps=0)
##D summary(mod5)
##D 
##D #############################################################################
##D # EXAMPLE 2: Venice chess data
##D #############################################################################
##D 
##D # See http://www.rasch.org/rmt/rmt113o.htm
##D # Linacre, J. M. (1997). Paired Comparisons with Standard Rasch Software.
##D # Rasch Measurement Transactions, 11:3, 584-585.
##D 
##D # dataset with chess games -> "D" denotes a draw (tie)
##D chessdata <- scan( what="character")
##D     1D.0..1...1....1.....1......D.......D........1.........1.......... Browne
##D     0.1.D..0...1....1.....1......D.......1........D.........1......... Mariotti
##D     .D0..0..1...D....D.....1......1.......1........1.........D........ Tatai
##D     ...1D1...D...D....1.....D......D.......D........1.........0....... Hort
##D     ......010D....D....D.....1......D.......1........1.........D...... Kavalek
##D     ..........00DDD.....D.....D......D.......1........D.........1..... Damjanovic
##D     ...............00D0DD......D......1.......1........1.........0.... Gligoric
##D     .....................000D0DD.......D.......1........D.........1... Radulov
##D     ............................DD0DDD0D........0........0.........1.. Bobotsov
##D     ....................................D00D00001.........1.........1. Cosulich
##D     .............................................0D000D0D10..........1 Westerinen
##D     .......................................................00D1D010000 Zichichi
##D 
##D L <- length(chessdata) / 2
##D games <- matrix( chessdata, nrow=L, ncol=2, byrow=TRUE )
##D G <- nchar(games[1,1])
##D # create matrix with results
##D results <- matrix( NA, nrow=G, ncol=3 )
##D for (gg in 1:G){
##D     games.gg <- substring( games[,1], gg, gg )
##D     ind.gg <- which( games.gg !="." )
##D     results[gg, 1:2 ] <- games[ ind.gg, 2]
##D     results[gg, 3 ] <- games.gg[ ind.gg[1] ]
##D             }
##D results <- as.data.frame(results)
##D results[,3] <- paste(results[,3] )
##D results[ results[,3]=="D", 3] <- 1/2
##D results[,3] <- as.numeric( results[,3] )
##D 
##D # fit model ignoring draws
##D mod1 <- sirt::btm( results, ignore.ties=TRUE, fix.eta=0, eps=0 )
##D summary(mod1)
##D 
##D # fit model with draws
##D mod2 <- sirt::btm( results, fix.eta=0, eps=0 )
##D summary(mod2)
## End(Not run)



