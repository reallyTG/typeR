library(seqRFLP)


### Name: seqRFLP-package
### Title: Simulation and visualization of Restriction Fragment Length
###   Polymorphism(RFLP) pattern from DNA sequences
### Aliases: seqRFLP-package seqRFLP
### Keywords: package

### ** Examples


### Featured examples
### 1. File(s) importing:

### 1.1 importing fasta files.
### read.fasta() example
### 
cat(
">No305",
"NTTCGAAAAACACACCCACTACTAAAANTTATCAGTCACT",
file = "dna1.fas", sep = "\n")
sequences <- read.fasta("dna1.fas")
unlink("dna1.fas")


### 1.2 Concatenating all fasta files in working directory to fasta data
### raw2Fas() example
cat(
">No305",
"NTTCGAAAAACACACCCACTACTAAAANTTATCAGTCACT",
file = "dna1.fas", sep = "\n")
cat(
">No304",
"ATTCGAAAAACACACCCACTACTAAAAATTATCAACCACT",
file = "dna2.fas", sep = "\n")
cat(
">No305",
"NTTCGAAAAACACACCCACTACTAAAANTTATCAGTCACT",
file = "dna3.fas", sep = "\n")

raw2Fas(getwd(), appendix = ".fas")

unlink("dna1.fas")
unlink("dna2.fas")
unlink("dna3.fas")

## 1.3 importing phy, nexus, and converting to fasta objects for further analysis.

##### read.nxs() example
data(fil.nxs)
writeLines(fil.nxs, "example.nxs")
nxs <- read.nxs("example.nxs")
as.fasta(nxs)
unlink("example.nxs")

##### read.phy() example
data(fil.phy)
writeLines(fil.phy, "example.phy")
phy <- read.phy("example.phy")
as.fasta(phy)
unlink("example.phy")

## 2 Check and visualising cutting patterns of restriction enzymes on sequences.

## 2.1 enzCut() example
data(enzdata)
enznames <- c("EcoRI", "Acc65I")
data(fil.phy)
fas <- ConvFas(fil = fil.phy, type = "phy")
enzCut(DNAsq = fas[2], enznames = "AluI", enzdata = enzdata)
rm(list = ls())

### 2.2  fragdat() example
data(enzdata)
data(fil.phy)
fas <- ConvFas(fil = fil.phy, type = "phy")
frag.dat(fil = fas, enznames = "EcoRI", enzdata = enzdata)

## 2.3 plotenz() example
data(enzdata)
data(fil.phy)
fas <- ConvFas(fil = fil.phy, type = "phy")
enznames <- c("EcoRI", "Acc65I", "HinfI")

plotenz(sequences = fas, enznames = enznames, 
        enzdata = enzdata, side = TRUE, type = "RFLP")
		
plotenz(sequences = fas, enznames = enznames, 
        enzdata = enzdata, side = FALSE, type = "RFLP")		
				
plotenz(sequences = fas, enznames = enznames, 
        enzdata = enzdata, side = TRUE, type = "TRFLP", "T3")

### 3 Sequence selection based on given primers.

### clipprobe()
## 3.1 Specify the forward and backward primer.
#clip the sequence between the backword and forward primer.
forProbe = ITS1F = 'CTTGGTCATTTAGAGGAAGTAA' # forward primer should be from the 5' to 3' end.
bacProbe = ITS4 = 'GCATATCAATAAGCGGAGGA'    # backward primer
#only sequence with two probes found could be clipped.

### 3.2 reading fasta data.
directory <- system.file("extdata", package = "seqRFLP")
path <- file.path(directory, "seqs.fasta")
fas <- read.fasta(path)

## 3.3 Clipping. Find clipped sequences, this usually takes less than 1 minunite.
## please wait for a moment.
clipped <- clipprobe(fas, forProbe, bacProbe, tol = 0, clipped.only = TRUE)

## 3.4 Checking the results.
## There are 368 selected sequences that could be clipped.
length(gnames.fas(clipped)) 
## ... in 393 original sequences.
length(gnames.fas(fas))
## Sequences that can not be clipped.
setdiff(gnames.fas(fas), gnames.fas(clipped))




