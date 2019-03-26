context("Start Round")

test_that("returns list",{
  expect_type(start_round(84),"list")
  expect_type(start_round(c(84,117)),"list")
  expect_identical(start_round(84),list(84))
  expect_identical(start_round(c(84,117)),list(84, 117))
})

context("Take a step")
data(roads)
data(alley)
data(node_locations)

test_that("steps are correct",{
  expect_identical(take_a_step(list(84),roads),                          list(c(84, 51)
                                                                             ,c(84, 65)
                                                                             ,c(84, 66)
                                                                             ,c(84, 67)
                                                                             ,c(84, 85)
                                                                             ,c(84, 86)
                                                                             ,c(84, 99)
                                                                             ,c(84, 100)))
  expect_identical(take_a_step(list(1),roads),                           list(c(1, 2)
                                                                             ,c(1, 6)
                                                                             ,c(1, 7)
                                                                             ,c(1, 8)
                                                                             ,c(1, 9)
                                                                             ,c(1, 24)
                                                                             ,c(1, 26)
                                                                             ,c(1, 28)))
  expect_identical(take_a_step(list(1),alley),                           list(c(1, 7)
                                                                             ,c(1, 26)))
  expect_identical(take_a_carriage(list(23)),                            list(c(23, 21, 20)
                                                                             ,c(23, 21, 40)
                                                                             ,c(23, 21, 41)
                                                                             ,c(23, 21, 42)
                                                                             ,c(23, 22, 42)
                                                                             ,c(23, 22, 77)
                                                                             ,c(23, 77, 22)
                                                                             ,c(23, 77, 75)
                                                                             ,c(23, 77, 76)
                                                                             ,c(23, 77, 90)
                                                                             ,c(23, 77, 91)
                                                                             ,c(23, 77, 92)
                                                                             ,c(23, 77, 93)
                                                                             ,c(23, 77, 94)))
  expect_identical(take_a_step(list(84),roads,list(c(84,51),c(84,100))), list(c(84, 65)
                                                                             ,c(84, 66)
                                                                             ,c(84, 67)
                                                                             ,c(84, 85)
                                                                             ,c(84, 86)
                                                                             ,c(84, 99)))
})

context("Inspecting")

test_that("Inspections are correct",{
  expect_identical(inspect_space(take_a_step(list(1),roads)
                                ,9
                                ,TRUE),list(c(1,9)))
  expect_identical(inspect_space(take_a_step(list(1),alley)
                                ,7
                                ,FALSE),list(c(1,26)))
})

context("End of Round")

test_that("Hideouts correct",{
  expect_identical(end_round(take_a_step(list(1),alley)),c(7,26))
  expect_identical(end_round(take_a_step(list(1),alley),c(26,45)),c(26))
})

context("Visuals")

test_that("Expect plot generates without errors",{
  expect_null(show_board(list(69),c(45,46),roads,alley,node_locations))
  expect_null(show_board(list(69),NULL,roads,alley,node_locations))
})
