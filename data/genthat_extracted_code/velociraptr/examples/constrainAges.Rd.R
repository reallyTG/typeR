library(velociraptr)


### Name: constrainAges
### Title: Constrain a dataset to only occurrences within a certain
###   age-range
### Aliases: constrainAges constrainAges,multiplyAges multiplyAges

### ** Examples


# Download a test dataset of Cenozoic bivalves.
# DataPBDB<-downloadPBDB(Taxa="Bivalvia",StartInterval="Cenozoic",StopInterval="Cenozoic")

 # Download the international epochs timescale from macrostrat.org
# Epochs<-downloadTime("international epochs")

# Find only occurrences that are temporally constrained to a single international epoch
# ConstrainedPBDB<-constrainAges(DataPBDB,Timescale=Epochs)

 # Create mutliple instances of a single occurrence for each epoch it occurs in
 # MultipliedPBDB<-multiplyAges(DataPBDB,Timescale=Epochs)




