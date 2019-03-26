#
# load DIAMOND assignment
#
dat1 <-load_edge_assignment("../test_data/test_all_taxa/allReads-diamond.list.txt", type = 'diamond')

# extract species list
#
species <- dplyr::filter(dat1, LEVEL == "species")
expect_that(length(species$TAXA), equals(116))
#
# all the rest we will keep the same
#
diamond_assignment1 <- dplyr::filter(dat1, LEVEL != "species")
diamond_assignment2 <- dplyr::filter(dat1, LEVEL != "species")
#
species1 <- species[1:90, ]
species2 <- species[91:116, ]
#
expect_that(dim(species1)[1], equals(90))
expect_that(dim(species2)[1], equals(26))
#
#
diamond_assignment1 <- rbind(diamond_assignment1, species1)
diamond_assignment2 <- rbind(species2, diamond_assignment2)
#
#
input <- list("project1" = diamond_assignment1, "project2" = diamond_assignment2)
#
#
merged <- merge_edge_assignments(input)
#
expect_that(dim(merged)[1], equals(dim(dat1)[1]))
