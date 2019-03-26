library(MSnID)


### Name: assess_missed_cleavages
### Title: Counts the missing cleavage sites within the peptides sequence
### Aliases: assess_missed_cleavages

### ** Examples

data(c_elegans)
# adding column numMissCleavages containing count of missed cleavages
msnidObj <- assess_missed_cleavages(msnidObj, 
                                    missedCleavagePattern="[KR](?=[^P$])")
# check the distribution
table(msnidObj$numMissCleavages)



