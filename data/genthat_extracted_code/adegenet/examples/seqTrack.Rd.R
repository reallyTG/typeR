library(adegenet)


### Name: seqTrack
### Title: SeqTrack algorithm for reconstructing genealogies
### Aliases: seqTrack seqTrack.default seqTrack.matrix plotSeqTrack
###   get.likelihood get.likelihood.seqTrack seqTrack-class
###   as.igraph.seqTrack plot.seqTrack

### ** Examples

## Not run: 
##D if(require(ape && require(igraph))){
##D ## ANALYSIS OF SIMULATED DATA ##
##D ## SIMULATE A GENEALOGY
##D dat <- haploGen(seq.l=1e4, repro=function(){sample(1:4,1)}, gen.time=1, t.max=3)
##D plot(dat, main="Simulated data")
##D 
##D ## SEQTRACK ANALYSIS
##D res <- seqTrack(dat, mu=0.0001, haplo.length=1e4) 
##D plot(res, main="seqTrack reconstruction")
##D 
##D ## PROPORTION OF CORRECT RECONSTRUCTION
##D mean(dat$ances==res$ances,na.rm=TRUE)
##D 
##D 
##D ## ANALYSIS OF PANDEMIC A/H1N1 INFLUENZA DATA ##
##D ## note:
##D ## this is for reproduction purpose only
##D ## seqTrack is best kept for the analysis
##D ## of densely sampled outbreaks, which
##D ## is not the case of this dataset.
##D ## 
##D dat <- read.csv(system.file("files/pdH1N1-data.csv",package="adegenet"))
##D ha <-  read.dna(system.file("files/pdH1N1-HA.fasta",package="adegenet"), format="fa")
##D na <- read.dna(system.file("files/pdH1N1-NA.fasta",package="adegenet"), format="fa")
##D 
##D 
##D ## COMPUTE NUCLEOTIDIC DISTANCES
##D nbNucl <- ncol(as.matrix(ha)) + ncol(as.matrix(na))
##D D <- dist.dna(ha,model="raw")*ncol(as.matrix(ha)) +
##D dist.dna(na,model="raw")*ncol(as.matrix(na))
##D D <- round(as.matrix(D))
##D 
##D 
##D ## MATRIX OF SPATIAL CONNECTIVITY
##D ## (to promote local transmissions)
##D xy <- cbind(dat$lon, dat$lat)
##D temp <- as.matrix(dist(xy))
##D M <- 1* (temp < 1e-10)
##D 
##D 
##D ## SEQTRACK ANALYSIS
##D dat$date <- as.POSIXct(dat$date)
##D res <- seqTrack(D, rownames(dat), dat$date, prox.mat=M, mu=.00502/365, haplo.le=nbNucl)
##D 
##D 
##D ## COMPUTE GENETIC LIKELIHOOD
##D p <- get.likelihood(res, mu=.00502/365, haplo.length=nbNucl)
##D # (these could be shown as colors when plotting results)
##D # (but mutations will be used instead)
##D 
##D 
##D ## EXAMINE RESULTS
##D head(res)
##D tail(res)
##D range(res$weight, na.rm=TRUE)
##D barplot(table(res$weight)/sum(!is.na(res$weight)), ylab="Frequency",
##D xlab="Mutations between inferred ancestor and descendent", col="orange")
##D 
##D 
##D ## DISPLAY SPATIO-TEMPORAL DYNAMICS 
##D if(require(maps)){
##D myDates <- as.integer(difftime(dat$date, as.POSIXct("2009-01-21"), unit="day"))
##D myMonth <- as.POSIXct(
##D c("2009-02-01", "2009-03-01","2009-04-01","2009-05-01","2009-06-01","2009-07-01"))
##D x.month <-  as.integer(difftime(myMonth, as.POSIXct("2009-01-21"), unit="day"))
##D 
##D 
##D ## FIRST STAGE:
##D ## SPREAD TO THE USA AND CANADA
##D curRange <- as.POSIXct(c("2009-03-29","2009-04-25"))
##D par(bg="deepskyblue")
##D map("world", fill=TRUE, col="grey")
##D opal <- palette()
##D palette(rev(heat.colors(10)))
##D plotSeqTrack(res, round(xy), add=TRUE,annot=FALSE,lwd=2,date.range=curRange,
##D col=res$weight+1)
##D title(paste(curRange, collapse=" to "))
##D legend("bottom", lty=1, leg=0:8, title="number of mutations", col=1:9,
##D lwd=2, horiz=TRUE)
##D 
##D 
##D ## SECOND STAGE:
##D ## SPREAD WITHIN AMERICA, FIRST SEEDING OUTSIDE AMERICA
##D curRange <- as.POSIXct(c("2009-04-30","2009-05-07"))
##D par(bg="deepskyblue")
##D map("world", fill=TRUE, col="grey")
##D opal <- palette()
##D palette(rev(heat.colors(10)))
##D plotSeqTrack(res, round(xy), add=TRUE,annot=FALSE,lwd=2,
##D date.range=curRange, col=res$weight+1)
##D title(paste(curRange, collapse=" to "))
##D legend("bottom", lty=1, leg=0:8, title="number of mutations",
##D col=1:9,lwd=2, horiz=TRUE)
##D 
##D 
##D ## THIRD STAGE:
##D ## PANDEMIC
##D curRange <- as.POSIXct(c("2009-05-15","2009-05-25"))
##D par(bg="deepskyblue")
##D map("world", fill=TRUE, col="grey")
##D opal <- palette()
##D palette(rev(heat.colors(10)))
##D plotSeqTrack(res, round(xy), add=TRUE,annot=FALSE,lwd=2, date.range=curRange,
##D col=res$weight+1)
##D title(paste(curRange, collapse=" to "))
##D legend("bottom", lty=1, leg=0:8, title="number of mutations",
##D col=1:9,lwd=2, horiz=TRUE)
##D 
##D }
##D }
## End(Not run)



