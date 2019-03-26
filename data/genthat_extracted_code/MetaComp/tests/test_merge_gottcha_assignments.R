#
# load GOTTCHA assignment
#
dat1 <- load_edge_assignment(file.path("../test_data/SSputum-dil-DNase-cDNA/gottcha-speDB-v",
                                       "allReads-gottcha-speDB-v.list.txt"), type = 'gottcha')

# extract species list
#
species <- dplyr::filter(dat1, LEVEL == "species")
expect_that(length(species$TAXA), equals(15))
#
# all the rest we will keep the same
#
gottcha_assignment1 <- dplyr::filter(dat1, LEVEL != "species")
gottcha_assignment2 <- dplyr::filter(dat1, LEVEL != "species")
#
species1 <- species[1:7, ]
species2 <- species[8:15, ]
#
expect_that(dim(species1)[1], equals(7))
expect_that(dim(species2)[1], equals(8))
#
#
gottcha_assignment1 <- rbind(gottcha_assignment1, species1)
gottcha_assignment2 <- rbind(species2, gottcha_assignment2)
#
#
input <- list("project1" = gottcha_assignment1, "project2" = gottcha_assignment2)
#
#
merged <- merge_edge_assignments(input)
#
expect_that(dim(merged)[1], equals(dim(dat1)[1]))
