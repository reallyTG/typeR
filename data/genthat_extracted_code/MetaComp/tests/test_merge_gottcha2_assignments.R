#
# load GOTTCHA2 assignment
#
dat1 <- load_edge_assignment(file.path("../test_data/SRR353621/SRR353621_gottcha2-speDB-refseq",
            "allReads.summary.tsv"), type= 'gottcha2')

# extract species list
#
species <- dplyr::filter(dat1, LEVEL == "species")
expect_that(length(species$TAXA), equals(66))
#
# all the rest we will keep the same
#
gottcha_assignment1 <- dplyr::filter(dat1, LEVEL != "species")
gottcha_assignment2 <- dplyr::filter(dat1, LEVEL != "species")
#
species1 <- species[1:32, ]
species2 <- species[33:66, ]
#
expect_that(dim(species1)[1], equals(32))
expect_that(dim(species2)[1], equals(34))
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
