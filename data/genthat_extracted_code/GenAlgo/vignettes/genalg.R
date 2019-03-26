### R code from vignette source 'genalg.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: lib
###################################################
library(GenAlgo)


###################################################
### code chunk number 2: cd
###################################################
library(ClassDiscovery)


###################################################
### code chunk number 3: GenAlg
###################################################
args(GenAlg)


###################################################
### code chunk number 4: mutate
###################################################
selection.mutate <- function(allele, context) {
  context <- as.data.frame(context)
  sample(1:nrow(context),1)
}


###################################################
### code chunk number 5: tour
###################################################
data(tourData09)


###################################################
### code chunk number 6: foo (eval = FALSE)
###################################################
## r <- rownames(tourData09)
## s <- enc2utf8(r)
## rownames(tourData09) <- s
## save(tourData09, file="tourData09.rda")
## rm(r,s)


###################################################
### code chunk number 7: genalg.Rnw:144-150
###################################################
require(xtable)
myalign <- "|l|rrrr|"
tab <- xtable(tourData09[1:15,],
              caption="",
              label="tour", align=myalign)
print(tab)


###################################################
### code chunk number 8: objective
###################################################
scores.fitness <- function(arow, context) {
  ifelse(sum(context$Cost[arow]) > 470,
         0,
         sum(context$Total[arow]))
}


###################################################
### code chunk number 9: setup0
###################################################
set.seed(821813)
n.individuals <- 200
n.features <- 9
y <- matrix(0, n.individuals, n.features)
for (i in 1:n.individuals) {
  y[i,] <- sample(1:nrow(tourData09), n.features)
}


###################################################
### code chunk number 10: my.ga
###################################################
my.ga <- GenAlg(y, scores.fitness, selection.mutate, tourData09, 0.001, 0.75)


###################################################
### code chunk number 11: summ
###################################################
summary(my.ga)


###################################################
### code chunk number 12: newGen
###################################################
my.ga <- newGeneration(my.ga)
summary(my.ga)


###################################################
### code chunk number 13: go100
###################################################
for (i in 1:100) {
  my.ga <- newGeneration(my.ga)
}
summary(my.ga)


###################################################
### code chunk number 14: slots
###################################################
my.ga@best.fit
mean(my.ga@fitness)


###################################################
### code chunk number 15: bestFound
###################################################
bestFound <- tourData09[my.ga@best.individual,]
bestFound <- bestFound[rev(order(bestFound$Total)),]


###################################################
### code chunk number 16: tab
###################################################
tab <- xtable(bestFound,
              caption="Best team found by a small genetic algorithm",
              label="good",
              align=myalign)
tab


###################################################
### code chunk number 17: genalg.Rnw:259-297 (eval = FALSE)
###################################################
## set.seed(274355)
## n.individuals <- 1000
## n.features <- 9
## y <- matrix(0, n.individuals, n.features)
## for (i in 1:n.individuals) {
##   y[i,] <- sample(1:nrow(tourData09), n.features)
## }
## my.ga <- GenAlg(y, scores.fitness, selection.mutate, tourData09, 0.001, 0.75)
## 
## # for each generation, we will save the results to a file
## output <- 'Generations'
## if (!file.exists(output)) dir.create(output)
## 
## # save the starting generation
## recurse <- my.ga
## filename <- file.path(output,"gen0000.txt")
## assign('junk', as.data.frame(recurse), env=.GlobalEnv, immediate=T)
## write.csv(junk, file=filename)
## 
## # iterate
## n.generations <- 1100
## diversity <- meanfit <- fitter <- rep(NA, n.generations)
## for (i in 1:n.generations) {
##   base <- ''
##   if (i < 1000) { base <- '0' }
##   if (i < 100) { base <- '00' }
##   if (i < 10) { base <- '000' }
##   filename <- file.path(output, paste("gen", base, i, '.txt', sep=''))
##   recurse <- newGeneration(recurse)
##   fitter[i] <- recurse@best.fit
##   meanfit[i] <- mean(recurse@fitness)
##   diversity[i] <- popDiversity(recurse)
##   cat(paste(filename, "\n"))
##   assign('junk', as.data.frame(recurse), env=.GlobalEnv, immediate=T)
##   write.csv(junk, file=filename)
## }
## 
## save(fitter, meanfit, recurse, diversity, file="gaTourResults.rda")


###################################################
### code chunk number 18: load
###################################################
data(gaTourResults)


###################################################
### code chunk number 19: bestFound
###################################################
newBest <- tourData09[recurse@best.individual,]
newBest <- newBest[rev(order(newBest$Total)),]


###################################################
### code chunk number 20: tab
###################################################
tab <- xtable(newBest,
              caption="Best team found by an extensive genetic algorithm",
              label="final",
              align=myalign)
print(tab)


###################################################
### code chunk number 21: genalg.Rnw:377-384
###################################################
plot(fitter, type='l', ylim=c(1000,4000), xlab="Generation", ylab="Fitness")
abline(h=max(fitter), col='gray', lty=2)
lines(fitter)
lines(meanfit, col='gray')
points(meanfit,
     pch=16, cex=0.4, col=jetColors(1100))
legend(800, 2500, c("Maximum", "Mean"), col=c("black", "blue"), lwd=2)


###################################################
### code chunk number 22: loess
###################################################
n.generations <- length(meanfit)
index <- 1:n.generations
lo <- loess(meanfit ~ index, span=0.08)
lof <- loess(fitter ~ index, span=0.08)


###################################################
### code chunk number 23: genalg.Rnw:407-414
###################################################
plot(meanfit, fitter, xlab="Smoothed Mean Fit", ylab="Smoothed Best Fit",
     col='gray', type='l')
points(lo$fitted, lof$fitted, 
     pch=16, cex=0.4, col=jetColors(1100))
points(2901:4000, rep(2800,1100), pch=16, cex=0.4, col=jetColors(1100))
text(3450, 2850, "Legend (Generation)")
text(seq(2900, 4100, length=5), rep(2770, 5), seq(0, 1200, by=300), cex=0.8)


###################################################
### code chunk number 24: genalg.Rnw:437-453
###################################################
opar <- par(mai=c(1, 1, 0.2, 1))
plot(fitter, type='l', xlab="Generation", ylab="Fitness")
text(900, 3950, "Best")
mcol <- "#888888"
lines(meanfit, col=mcol)
text(900, 3700, "Mean", col=mcol)
par(new=T)
par(mai=c(1, 1, 0.2, 1))
plot(diversity, col='gray', type='l', ylim=c(0,9), xlab='', ylab='', yaxt='n')
points(diversity, pch=16, cex=0.4, col=jetColors(1100))
mycol <- "#ff4400"
mtext("Average Diversity", side=4, line=2, col=mycol)
text(900, 2, "Diversity", col=mycol)
axis(4, col=mycol, col.ticks=mycol, col.axis=mycol, lwd=2)
abline(h=c(1, 1.25, 1.5), col="#00ddff")#col="#ff7700")
par(opar)


###################################################
### code chunk number 25: cor
###################################################
cor(diversity, meanfit)
cor(diversity, meanfit, method='spearman')


###################################################
### code chunk number 26: ident
###################################################
temp <- apply(recurse@data, 1, function(x, y) {
  all(sort(x)==sort(y))
}, recurse@best.individual)
sum(temp)


###################################################
### code chunk number 27: mahafit
###################################################
mahaFitness <- function(arow, context) {
  maha(t(context$dataset[arow,]), context$gps, method='var')
}


###################################################
### code chunk number 28: genalg.Rnw:544-565 (eval = FALSE)
###################################################
## ########################################################################
## # Now we instantiate the specific genetic algorithm described in the
## # previous section.
## 
## tourData09 <- read.csv("tourResults.csv", row.names=1)
## tourData09$Total <- tourData09$Scores + tourData09$JerseyBonus
## tourData09 <- tourData09[rev(order(tourData09$Total)),]
## tourData09 <- tourData09[, c("Cost", "Scores", "JerseyBonus", "Total")]
## 
## ########################################################################
## 
## if(FALSE) {
## opar <- par(mfrow=c(2,1))
## spikes <- recurse@best.individual
## print(recurse@best.fit)
## plot(recurse@fitness, ylim=c(0, 4000))
## abline(h=median(recurse@fitness))
## hist(recurse@data, nclass=33)
## par(opar)
## 
## }


