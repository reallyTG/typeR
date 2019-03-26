library(CHNOSZ)


### Name: protein.info
### Title: Summaries of Thermodynamic Properties of Proteins
### Aliases: protein.info pinfo protein.length protein.formula
###   protein.obigt protein.basis protein.equil

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
# search by name in thermo$protein
ip1 <- pinfo("LYSC_CHICK")
ip2 <- pinfo("LYSC", "CHICK")
# these are the same
stopifnot(all.equal(ip1, ip2))
# two organisms with the same protein name
ip3 <- pinfo("MYG", c("HORSE", "PHYCA"))
# their amino acid compositions
pinfo(ip3)
# their thermodynamic properties by group additivity
protein.obigt(ip3)

# an example of an unrecognized protein name
ip4 <- pinfo("MYGPHYCA")
stopifnot(is.na(ip4))

## example for chicken lysozyme C
# index in thermo$protein
ip <- pinfo("LYSC_CHICK")
# amino acid composition
pinfo(ip)
# length and chemical formula
protein.length(ip)
protein.formula(ip)
# group additivity for thermodynamic properties and HKF equation-of-state
# parameters of non-ionized protein
protein.obigt(ip)
# calculation of standard thermodynamic properties
# (subcrt uses the species name, not ip)
subcrt("LYSC_CHICK")
# affinity calculation, protein identified by ip
basis("CHNOS+")
affinity(iprotein=ip)
# affinity calculation, protein loaded as a species
species("LYSC_CHICK")
affinity()
# NB: subcrt() only shows the properties of the non-ionized
# protein, but affinity() uses the properties of the ionized
# protein if the basis species have H+

## these are all the same
protein.formula("P53_PIG")
protein.formula(pinfo("P53_PIG"))
protein.formula(pinfo(pinfo("P53_PIG")))

## using protein.formula: average oxidation state of 
## carbon of proteins from different organisms (Dick, 2014)
# get amino acid compositions of microbial proteins 
# generated from the RefSeq database 
file <- system.file("extdata/refseq/protein_refseq.csv.xz", package="CHNOSZ")
ip <- add.protein(read.csv(file, as.is=TRUE))
# only use those organisms with a certain
# number of sequenced bases
ip <- ip[as.numeric(thermo$protein$abbrv[ip]) > 50000]
pf <- protein.formula(thermo$protein[ip, ])
zc <- ZC(pf)
# the organism names we search for
# "" matches all organisms
terms <- c("Natr", "Halo", "Rhodo", "Acido", "Methylo",
  "Chloro", "Nitro", "Desulfo", "Geo", "Methano",
  "Thermo", "Pyro", "Sulfo", "Buchner", "")
tps <- thermo$protein$ref[ip]
plot(0, 0, xlim=c(1, 15), ylim=c(-0.3, -0.05), pch="",
  ylab=expression(italic(Z)[C]),
  xlab="", xaxt="n", mar=c(6, 3, 1, 1))
for(i in 1:length(terms)) {
  it <- grep(terms[i], tps)
  zct <- zc[it]
  points(jitter(rep(i, length(zct))), zct, pch=20)
}
terms[15] <- paste("all", length(ip))
axis(1, 1:15, terms, las=2)
title(main=paste("Average oxidation state of carbon in proteins",
  "by taxID in NCBI RefSeq (after Dick, 2014)", sep="\n"))

## Don't show: 
opar <- par(no.readonly=TRUE)
## End(Don't show)
# using pinfo() with regexp=TRUE:
# plot ZC and nH2O/residue of HOX proteins
# basis species: glutamine-glutamic acid-cysteine-O2-H2O
basis("QEC")
# device setup
par(mfrow=c(2, 2))
# a red-blue scale from 1-13
col <- ZC.col(1:13)
# axis labels
ZClab <- axis.label("ZC")
nH2Olab <- expression(bar(italic(n))[H[2]*O])
# loop over HOX gene clusters
for(cluster in c("A", "B", "C", "D")) {
  # get protein indices
  pattern <- paste0("^HX", cluster)
  ip <- pinfo(pattern, "HUMAN", regexp=TRUE)
  # calculate ZC and nH2O/residue
  thisZC <- ZC(protein.formula(ip))
  thisH2O <- protein.basis(ip)[, "H2O"] / protein.length(ip)
  # plot lines
  plot(thisZC, thisH2O, type="l", xlab=ZClab, ylab=nH2Olab)
  # the number of the HOX gene
  pname <- pinfo(ip)$protein
  nHOX <- as.numeric(gsub("[A-Za-z]*", "", pname))
  # plot colored points
  points(thisZC, thisH2O, pch=19, col=col[nHOX], cex=3.5)
  points(thisZC, thisH2O, pch=19, col="white", cex=2.5)
  # plot the number of the HOX gene
  text(thisZC, thisH2O, nHOX)
  # add title
  title(main=paste0("HOX", cluster))
}
## Don't show: 
par(opar)
## End(Don't show)



