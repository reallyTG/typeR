library(outbreaker)


### Name: simulated outbreak dataset
### Title: Toy outbreak dataset used to illustrate outbreaker
### Aliases: 'simulated outbreak dataset' fakeOutbreak
### Keywords: datasets

### ** Examples


## Not run: 
##D ## COMMAND LINES TO GENERATE SIMILAR DATA ##
##D w <- c(0, 0.5, 1, 0.75)
##D ## note: this works only if outbreak has at least 30 case
##D dat <- simOutbreak(R0 = 2, infec.curve = w, n.hosts = 100)[1:30]
##D collecDates <- dat$onset + sample(0:3, size=30, replace=TRUE, prob=w)
## End(Not run)

## EXAMPLE USING TOYOUTBREAK ##
## LOAD DATA, SET RANDOM SEED
data(fakeOutbreak)
attach(fakeOutbreak)

## VISUALIZE DYNAMICS
matplot(dat$dynam, type="o", pch=20, lty=1,
   main="Outbreak dynamics", xlim=c(0,28))
legend("topright", legend=c("S","I","R"), lty=1, col=1:3)

## VISUALIZE TRANSMISSION TREE
plot(dat, annot="dist", main="Data - transmission tree")
mtext(side=3, "arrow annotations are numbers of mutations")


## Not run: 
##D ## RUN OUTBREAKER - PARALLEL VERSION
##D ## (takes < 1 min))
##D set.seed(1)
##D res <-  outbreaker.parallel(n.runs=4, dna=dat$dna,
##D    dates=collecDates,w.dens=w, n.iter=5e4)
## End(Not run)


## ASSESS CONVERGENCE OF CHAINS
plotChains(res)
plotChains(res, burnin=2e4)

## REPRESENT POSTERIOR ANCESTRIES
transGraph(res, annot="", main="Posterior ancestries", thres=.01)

## GET CONSENSUS ANCESTRIES
tre <- get.tTree(res)
plot(tre, annot="", main="Consensus ancestries")

## SHOW DISCREPANCIES
col <- rep("lightgrey", 30)
col[which(dat$ances != tre$ances)] <- "pink"
plot(tre, annot="", vertex.color=col, main="Consensus ancestries")
mtext(side=3, text="cases with erroneous ancestries in pink")

## GET EFFECTIVE REPRODUCTION OVER TIME
get.Rt(res)

## GET INDIVIDUAL EFFECTIVE REPRODUCTION
head(get.R(res))
boxplot(get.R(res), col="grey", xlab="Case",
        ylab="Effective reproduction number")

## GET MUTATION RATE PER TIME UNIT
## per genome
head(get.mu(res))

## per nucleotide
mu <- get.mu(res, genome.size=1e4)
head(mu)

summary(mu)
hist(mu, border="lightgrey", col="grey", xlab="Mutation per day and nucleotide",
     main="Posterior distribution of mutation rate")

detach(fakeOutbreak)





