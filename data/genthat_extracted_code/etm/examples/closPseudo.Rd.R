library(etm)


### Name: closPseudo
### Title: Pseudo Value Regression for the Extra Length-of-Stay
### Aliases: closPseudo
### Keywords: survival

### ** Examples

library(kmi)

## data in kmi package
data(icu.pneu)
my.icu.pneu <- icu.pneu

my.icu.pneu <- my.icu.pneu[order(my.icu.pneu$id, my.icu.pneu$start), ]
masque <- diff(my.icu.pneu$id)

my.icu.pneu$from <- 0
my.icu.pneu$from[c(1, masque) == 0] <- 1

my.icu.pneu$to2 <- my.icu.pneu$event
my.icu.pneu$to2[my.icu.pneu$status == 0] <- "cens"
my.icu.pneu$to2[c(masque, 1) == 0] <- 1


my.icu.pneu$to <- ifelse(my.icu.pneu$to2 %in% c(2, 3), 2,
                         my.icu.pneu$to2)

my.icu.pneu <- my.icu.pneu[, c("id", "start", "stop", "from", "to",
                               "to2", "age", "sex")]
names(my.icu.pneu)[c(2, 3)] <- c("entry", "exit")

## computation of the pseudo-observations
## Not run: 
##D ps.icu.pneu <- closPseudo(my.icu.pneu, c("0", "1", "2"), tra_ill(), "cens",
##D                           formula = ~ sex + age)
##D 
##D ## regression model using geepack
##D require(geepack)
##D fit <- geeglm(ps.e.phi ~ sex + age, id = id, data = ps.icu.pneu$pseudoData,
##D               family = gaussian)
##D 
##D summary(fit)
## End(Not run)



