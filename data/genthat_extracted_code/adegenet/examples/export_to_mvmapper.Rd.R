library(adegenet)


### Name: export_to_mvmapper
### Title: Export analysis for mvmapper visualisation
### Aliases: export_to_mvmapper swallowtails export_to_mvmapper.default
###   export_to_mvmapper.dapc export_to_mvmapper.dudi
###   export_to_mvmapper.spca

### ** Examples


# An example using the microsatellite dataset of Dupuis et al. 2016 (781
# individuals, 10 loci, doi: 10.1111/jeb.12931)

# Reading input file from adegenet

input_data <- system.file("data/swallowtails.rda", package="adegenet")
data(swallowtails)


# conducting a DAPC (n.pca determined using xvalDapc, see ??xvalDapc)

dapc1 <- dapc(swallowtails, n.pca=40, n.da=200)


# read in swallowtails_loc.csv, which contains "key", "lat", and "lon"
# columns with column headers (this example contains additional columns
# containing species identifications, locality descriptions, and COI
# haplotype clades)

input_locs <- system.file("files/swallowtails_loc.csv", package = "adegenet")
loc <- read.csv(input_locs, header = TRUE)


# generate mvmapper input file, automatically write the output to a csv, and
# name the output csv "mvMapper_Data.csv"

out <- export_to_mvmapper(dapc1, loc, write_file = TRUE,
                          out_file = "mvMapper_Data.csv")




