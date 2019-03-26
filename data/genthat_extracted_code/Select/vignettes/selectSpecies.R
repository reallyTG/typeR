## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(Select)
library(lattice)
library(FD)

## ------------------------------------------------------------------------
### Set size of species pool
Spp <- 5

### Set trait values for each species as integers from 1 to 5 (Spp)
### Note that we make this a matrix to pass it into the function
trait <- as.matrix(data.frame(trait = c(1:Spp)))

### Most datasets have species names as row names, so let's add arbitrary row names using letters
rownames(trait) <- c(letters[1:nrow(trait)])

## ------------------------------------------------------------------------
### Store results from selectSpecies() into 'result1'
result1 <- selectSpecies(t2c = trait, constraints = c(trait=3.5), t2d = trait, obj = "H")

# Use the plotProbs() function to plot the abundance distribution
plotProbs(result1, trait, xlab = "Species")

## ------------------------------------------------------------------------
### compare result1 with identical maxent output from FD package. Be sure to have the FD package installed.
round(FD::maxent(constr = c(3.5), states = trait)$prob, 5)
round(t(result1$prob), 5)

## ------------------------------------------------------------------------
### Store results from selectSpecies() into 'result2'. Note the only difference with result1 is a different objective function (Q).
result2 <- selectSpecies(t2c = trait, constraints = c(trait=3.5), t2d = trait, obj = "Q")

# plot result2
plotProbs(result2, trait, xlab = "Species")

## ------------------------------------------------------------------------
### Store results from selectSpecies() into 'result3'. Note the only difference with result2 is a different objective function (QH)
result3 <- selectSpecies(t2c = trait, constraints = c(trait=3.5), t2d = trait, obj="QH")

# plot result3
plotProbs(result3, trait, xlab = "Species")

## ------------------------------------------------------------------------
### Store results from selectSpecies() into 'result4'
result4 <- selectSpecies(t2d = trait, obj = "QH")

# plot result4
plotProbs(result4, trait, xlab = "Species")


## ------------------------------------------------------------------------
### 2-dimensional trait matrix of 16 species, evenly spaced between trait values 1 through 4
trait.matrix <- as.matrix(cbind(traitX = c(rep(1,4), rep(2,4), rep(3,4), rep(4,4)), traitY = c(rep(c(1,2,3,4),4))))

### specify species names
rownames(trait.matrix) <- c(letters[1:16])

## ------------------------------------------------------------------------
### Create two evenly-spaced orthogonal traits
traitX <- matrix(c(rep(1,4), rep(2,4), rep(3,4), rep(4,4)))
traitY <- matrix(c(rep(c(1,2,3,4),4)))
rownames(traitX) <- c(letters[1:16]); colnames(traitX) <- c("traitX")
rownames(traitY) <- c(letters[1:16]); colnames(traitY) <- c("traitY")

### Store results from selectSpecies() into 'result5'
result5 <- selectSpecies(t2c = traitX, constraints = c(traitX=3.5), t2d = traitY, obj = "Q", capd = FALSE)

### plot result5
trait.matrix <- cbind(traitX, traitY)
plotProbs(result5, trait.matrix, cex.lab = 0.7)

## ------------------------------------------------------------------------
### Store results from selectSpecies() into 'result6'
# obj: select the QH objective function to maximize both Rao's Q and H, and cap the distance matrix by setting capd = TRUE
result6 <- selectSpecies(t2c = traitX, constraints = c(traitX=3.5), t2d = traitY, obj = "QH", capd = TRUE)

### plot result6
plotProbs(result6, trait.matrix, cex.lab = 0.7)

## ------------------------------------------------------------------------
### load serpentine data (available in the R package) 
serpentine <- read.csv("traits.serpentine.california.csv", header = TRUE, row.names = 1)

### take logs and rescale to unit variance
wue <- data.frame(wue = scale(log(serpentine$wue)))
rootdepth <- data.frame(rootdepth = scale(log(serpentine$rootdepth)))

### transfer species row names
rownames(wue) <- rownames(serpentine)
rownames(rootdepth) <- rownames(serpentine)

# set constraint on wue as the 67% quantile of wue distribution
wue.constraint <- c(quantile(wue$wue, 0.67))
names(wue.constraint) <- c("wue")

## ------------------------------------------------------------------------
### Store results from selectSpecies() into 'result7'
result7 <- selectSpecies(t2c = as.matrix(wue), constraints = c(wue.constraint), t2d = as.matrix(rootdepth), capd = TRUE, obj = "QH")

### plot result7
plotProbs(result7, traits = cbind(wue,rootdepth), xlab = "Water use efficiency", ylab = "Rooting depth", colors = c("darkolivegreen4", "gold2"), cex.lab = 0.7)

