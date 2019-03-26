#
# load BWA assignment
#
dat1 <- load_edge_assignment("../test_data/SSputum-no-cDNA/bwa/allReads-bwa.list.txt", type = 'bwa')

# extract species list
#
species <- dplyr::filter(dat1, LEVEL == "species")
expect_that(length(species$TAXA), equals(320))
#
# all the rest we will keep the same
#
bwa_assignment1 <- dplyr::filter(dat1, LEVEL != "species")
bwa_assignment2 <- dplyr::filter(dat1, LEVEL != "species")
#
species1 <- species[1:200, ]
species2 <- species[201:320, ]
#
expect_that(dim(species1)[1], equals(200))
expect_that(dim(species2)[1], equals(120))
#
#
bwa_assignment1 <- rbind(bwa_assignment1, species1)
bwa_assignment2 <- rbind(species2, bwa_assignment2)
#
#
input <- list("project1" = bwa_assignment1, "project2" = bwa_assignment2)
#
#
merged <- merge_edge_assignments(input)
#
expect_that(dim(merged)[1], equals(dim(dat1)[1]))

