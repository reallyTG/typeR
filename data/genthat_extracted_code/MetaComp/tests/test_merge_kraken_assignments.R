#
# load KRAKEN assignment
#
dat1 <- load_edge_assignment(file.path("../test_data/SSputum-no-cDNA/kraken_mini",
          "allReads-kraken_mini.list.txt"), type = 'kraken')

# extract species list
#
species <- dplyr::filter(dat1, LEVEL == "species")
expect_that(length(species$TAXA), equals(815))
#
# all the rest we will keep the same
#
kraken_assignment1 <- dplyr::filter(dat1, LEVEL != "species")
kraken_assignment2 <- dplyr::filter(dat1, LEVEL != "species")
#
species1 <- species[1:715, ]
species2 <- species[716:815, ]
#
expect_that(dim(species1)[1], equals(715))
expect_that(dim(species2)[1], equals(100))
#
#
kraken_assignment1 <- rbind(kraken_assignment1, species1)
kraken_assignment2 <- rbind(species2, kraken_assignment2)
#
#
input <- list("project1" = kraken_assignment1, "project2" = kraken_assignment2)
#
#
merged <- merge_edge_assignments(input)
#
expect_that(dim(merged)[1], equals(dim(dat1)[1]))
