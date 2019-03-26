library(seqRFLP)


### Name: clipprobe
### Title: Finding the sequences that could be clipped given two primers.
### Aliases: clipprobe
### Keywords: PCR sequence

### ** Examples

### clipprobe() example

## Step1 Specify the forward and backward primer.
#clip the sequence between the backword and forward primer.
forProbe = ITS1F = 'CTTGGTCATTTAGAGGAAGTAA' # forward primer should be from the 5' to 3' end.
bacProbe = ITS4 = 'GCATATCAATAAGCGGAGGA'    # backward primer
#only sequence with two probes found could be clipped.

### Step2 reading sequences from external data in package.
directory <- system.file("extdata", package = "seqRFLP")
path <- file.path(directory, "seqs.fasta")
fas <- read.fasta(path)

## Step3 Clipping. Find clipped sequences, this usually takes less than 1 minute.
## please wait for a moment.
clipped <- clipprobe(fas, forProbe, bacProbe, tol = 2, clipped.only = TRUE)

## Step4 Checking the results.
## 368 selected sequences that could be clipped.
length(gnames.fas(clipped)) 
## 393 original sequences.
length(gnames.fas(fas))
## Sequences that can not be clipped.
setdiff(gnames.fas(fas), gnames.fas(clipped))




