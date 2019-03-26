library(alakazam)


### Name: aminoAcidProperties
### Title: Calculates amino acid chemical properties for sequence data
### Aliases: aminoAcidProperties

### ** Examples

# Subset example data
db <- ExampleDb[c(1,10,100), c("SEQUENCE_ID", "JUNCTION")]

# Calculate default amino acid properties from amino acid sequences
# Use a custom output column prefix
db$JUNCTION_TRANS <- translateDNA(db$JUNCTION)
aminoAcidProperties(db, seq="JUNCTION_TRANS", label="JUNCTION")
# Calculate default amino acid properties from DNA sequences
aminoAcidProperties(db, seq="JUNCTION", nt=TRUE)

# Use the Grantham, 1974 side chain volume scores from the seqinr package
# Set pH=7.0 for the charge calculation
# Calculate only average volume and charge
# Remove the head and tail amino acids from the junction, thus making it the CDR3
library(seqinr)
data(aaindex)
x <- aaindex[["GRAR740103"]]$I
# Rename the score vector to use single-letter codes
names(x) <- translateStrings(names(x), ABBREV_AA)
# Calculate properties
aminoAcidProperties(db, property=c("bulk", "charge"), seq="JUNCTION", nt=TRUE, 
                    trim=TRUE, label="CDR3", bulkiness=x, pH=7.0)




