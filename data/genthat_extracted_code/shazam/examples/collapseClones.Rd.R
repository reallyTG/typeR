library(shazam)


### Name: collapseClones
### Title: Constructs effective clonal sequences for all clones
### Aliases: collapseClones

### ** Examples

# Subset example data
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE %in% c("IgA", "IgG") & SAMPLE == "+7d" &
                        CLONE %in% c("3100", "3141", "3184"))

# thresholdedFreq method, resolving ties deterministically without using ambiguous characters
clones <- collapseClones(db, method="thresholdedFreq", minimumFrequency=0.6,
                         includeAmbiguous=FALSE, breakTiesStochastic=FALSE)

# mostCommon method, resolving ties deterministically using ambiguous characters
clones <- collapseClones(db, method="mostCommon", 
                         includeAmbiguous=TRUE, breakTiesStochastic=FALSE)

# Make a copy of db that has a mutation frequency column
db2 <- observedMutations(db, frequency=TRUE, combine=TRUE)

# mostMutated method, resolving ties stochastically
clones <- collapseClones(db2, method="mostMutated", muFreqColumn="MU_FREQ", 
                         breakTiesStochastic=TRUE, breakTiesByColumns=NULL)
                         
# mostMutated method, resolving ties deterministically using additional columns
clones <- collapseClones(db2, method="mostMutated", muFreqColumn="MU_FREQ", 
                         breakTiesStochastic=FALSE, 
                         breakTiesByColumns=list(c("DUPCOUNT"), c(max)))

# Build consensus for V segment only
# Capture all nucleotide variations using ambiguous characters 
clones <- collapseClones(db, method="catchAll", regionDefinition=IMGT_V)

# Return the same number of rows as the input
clones <- collapseClones(db, method="mostCommon", expandedDb=TRUE)




