#
# load PANGIA assignment
#
dat1 <- data.frame(load_edge_assignment(
  "../test_data/test_all_taxa/allReads-pangia.list.txt", type = 'pangia'))

# extract strain list
#
strain <- dplyr::filter(dat1, LEVEL == "strain")
expect_that(length(strain$TAXA), equals(17))
#
# all the rest we will keep the same
#
pangia_assignment1 <- dplyr::filter(dat1, LEVEL != "strain")
pangia_assignment2 <- dplyr::filter(dat1, LEVEL != "strain")
#
strain1 <- strain[1:10, ]
strain2 <- strain[11:17, ]
#
expect_that(dim(strain1)[1], equals(10))
expect_that(dim(strain2)[1], equals(7))
#
#
pangia_assignment1 <- rbind(pangia_assignment1, strain1)
pangia_assignment2 <- rbind(strain2, pangia_assignment2)
#
#
input <- list("project1" = pangia_assignment1, "project2" = pangia_assignment2)
#
#
merged <- merge_edge_assignments(input)
#
expect_that(dim(merged)[1], equals(dim(dat1)[1]))
