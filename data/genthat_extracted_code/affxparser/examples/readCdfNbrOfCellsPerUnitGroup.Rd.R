library(affxparser)


### Name: readCdfNbrOfCellsPerUnitGroup
### Title: Gets the number of cells (probes) that each group of each unit
###   in a CDF file
### Aliases: readCdfNbrOfCellsPerUnitGroup
### Keywords: file IO internal

### ** Examples

##############################################################
if (require("AffymetrixDataTestFiles")) {            # START #
##############################################################

cdfFile <- findCdf("Mapping10K_Xba131")

groups <- readCdfNbrOfCellsPerUnitGroup(cdfFile)

# Number of units read
print(length(groups))
##   11564

# Details on two units
print(groups[56:57])
## $`SNP_A-1516438`
## SNP_A-1516438C SNP_A-1516438T SNP_A-1516438C SNP_A-1516438T
##             10             10             10             10
##
## $`SNP_A-1508602`
## SNP_A-1508602A SNP_A-1508602G SNP_A-1508602A SNP_A-1508602G
##             10             10             10             10


# Number of groups with different number of cells
print(table(unlist(groups)))
##    10    60
## 46240     4


# Number of cells per unit
nbrOfCellsPerUnit <- unlist(lapply(groups, FUN=sum))
print(table(nbrOfCellsPerUnit))
nbrOfCellsPerUnit
##    40    60
## 11560     4


# Number of groups per unit
nbrOfGroupsPerUnit <- unlist(lapply(groups, FUN=length))

# Details on a few units
print(nbrOfGroupsPerUnit[20:30])
## SNP_A-1512666 SNP_A-1512740 SNP_A-1512132 SNP_A-1516082 SNP_A-1511962
##             4             4             4             4             4
## SNP_A-1515637 SNP_A-1515878 SNP_A-1518789 SNP_A-1518296 SNP_A-1519701
##             4             4             4             4             4
## SNP_A-1511743
##             4

# Number of units for each unique number of groups
print(table(nbrOfGroupsPerUnit))
## nbrOfGroupsPerUnit
##     1     4
##     4 11560

x <- list()
for (size in unique(nbrOfGroupsPerUnit)) {
  subset <- groups[nbrOfGroupsPerUnit==size]
  t <- matrix(unlist(subset), nrow=size)
  colnames(t) <- names(subset)
  x[[as.character(size)]] <- t
  rm(subset, t)
}

# Check if there are any quartet units where the number
# of cells in Group 1 & 2 or Group 3 & 4 does not have
# the same number of cells.
# Group 1 & 2
print(sum(x[["4"]][1,]-x[["4"]][2,] != 0))
# 0

# Group 3 & 4
print(sum(x[["4"]][3,]-x[["4"]][4,] != 0))
# 0

##############################################################
}                                                     # STOP #
##############################################################



