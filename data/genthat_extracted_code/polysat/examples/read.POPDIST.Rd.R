library(polysat)


### Name: read.POPDIST
### Title: Read Genotype Data in POPDIST Format
### Aliases: read.POPDIST
### Keywords: file

### ** Examples

# Create a file to read (this is typically done in a text editor)
cat("An example for the read.POPDIST documentation.",
"abcR",
"abcQ",
"Pop",
"Piscataqua\t, 0204 0505",
"Piscataqua\t, 0404 0307",
"Piscataqua\t, 050200 030509",
"Pop",
"Salmon Falls\t, 1006\t0805",
"Salmon Falls\t, 0510\t0308",
"Pop",
"Great Works\t, 050807 030800",
"Great Works\t, 0000 0408",
"Great Works\t, 0707 0305",
file="testPOPDIST.txt", sep="\n")

# View the file in the R console (or open it in a text editor)
cat(readLines("testPOPDIST.txt"), sep="\n")

# Read the file into a "genambig" object
fishes <- read.POPDIST("testPOPDIST.txt")

# View the data in the object
summary(fishes)
PopNames(fishes)
PopInfo(fishes)
Ploidies(fishes)
viewGenotypes(fishes)



