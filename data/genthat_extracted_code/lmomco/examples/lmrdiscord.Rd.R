library(lmomco)


### Name: lmrdiscord
### Title: Compute Discordance on L-CV, L-skew, and L-kurtosis
### Aliases: lmrdiscord
### Keywords: L-moment (hypothesis)

### ** Examples

## Not run: 
##D # This is the canonical test of lmrdiscord().
##D library(lmomRFA) # Import lmomRFA, needs lmom package too
##D data(Cascades)   # Extract Hosking's data use in his examples
##D data <- as.regdata(Cascades) # A "regional" data structure
##D Dhosking <- sort(regtst(data)$D, decreasing=TRUE) # Discordancy
##D 
##D Dlmomco <- lmrdiscord(site=data$name, t2=data$t, t3=data$t_3, t4=data$t_4)
##D 
##D Dasquith <- Dlmomco$D
##D # Now show the site id, and the two discordancy computations
##D print(data.frame(NAME=data$name, Dhosking=Dhosking,
##D                                  Dasquith=Dasquith))
##D # The Dhosking and Dasquith columns had better match!
##D 
##D set.seed(3) # This seed produces a "*" and "**", but users
##D # are strongly encouraged to repeat the folowing code block
##D # over and over with an unspecified seed and look at the table.
##D n <- 30 # simulation sample size
##D par1 <- lmom2par(vec2lmom(c(1, .23, .2, .1)), type="kap")
##D par2 <- lmom2par(vec2lmom(c(1, .5, -.1)),      type="gev")
##D name <- t2 <- t3 <- t4 <- vector(mode="numeric")
##D for(i in 1:20) {
##D   X <- rlmomco(n, par1); lmr <- lmoms(X)
##D   t2[i] <- lmr$ratios[2]
##D   t3[i] <- lmr$ratios[3]
##D   t4[i] <- lmr$ratios[4]
##D   name[i] <- "kappa"
##D }
##D j <- length(t2)
##D for(i in 1:3) {
##D   X <- rlmomco(n, par2); lmr <- lmoms(X)
##D   t2[j + i] <- lmr$ratios[2]
##D   t3[j + i] <- lmr$ratios[3]
##D   t4[j + i] <- lmr$ratios[4]
##D   name[j + i] <- "gev"
##D }
##D D <- lmrdiscord(site=name, t2=t2, t3=t3, t4=t4)
##D print(D)
##D 
##D plotlmrdia(lmrdia(), xlim=c(-.2,.6), ylim=c(-.1, .4),
##D            autolegend=TRUE, xleg=0.1, yleg=.4)
##D points(D$t3,D$t4)
##D text(D$t3,D$t4,D$site, cex=0.75, pos=3)
##D text(D$t3,D$t4,D$D, cex=0.75, pos=1) #
## End(Not run)



