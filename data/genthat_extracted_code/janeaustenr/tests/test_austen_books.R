# tests for austen_books function

context("Tidy dataframe for books")

suppressPackageStartupMessages(library(dplyr))

test_that("factor order is correct", {
        d <- austen_books()
        expect_equal(levels(d$book)[1], "Sense & Sensibility")
        expect_equal(levels(d$book)[6], "Persuasion")
})

test_that("tidy frame for Austen books is right", {
        d <- austen_books() %>% 
                group_by(book) %>%
                summarise(total_lines = n())
        expect_equal(nrow(d), 6)
        expect_equal(ncol(d), 2)
        # the factor levels still in the right order?
        expect_equal(as.character(d$book[1]), "Sense & Sensibility")
        expect_equal(as.character(d$book[6]), "Persuasion")
        # Persuasion has fewer lines than Emma?
        expect_lt(d$total_lines[6], d$total_lines[4])
})
