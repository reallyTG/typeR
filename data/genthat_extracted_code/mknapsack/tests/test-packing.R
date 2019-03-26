library(data.table)
library(mockery)

# remove false warning related to data.table fields
container <- container.moq <- NULL

#' build the test dataset
units <- fread("unit-utility.txt", header = T)
moqs <- c("A" = 10, "B" = 5, "C" = 2)
moqs <- data.table(sku = names(moqs), moq = moqs)
units <- merge(units, moqs, by = "sku", all.x = TRUE)

context("moq group")

describe("group_moq", {
  it("combines data provided at unit level to MOQ level", {
    units.combined <- group_moq(units)

    expect_identical(sum(units.combined$units), nrow(units),
                     label = "Check that number of units same as was given")
    expect_identical(nrow(units.combined[sku == "A" & units == 10]), 1L,
                     label = "One line has MOQ number of units")
    expect_identical(nrow(units.combined[sku == "A" & units > 10]), 0L,
                     label = "No records have more units than MOQ")
    expect_identical(nrow(units.combined[sku == "A" & !units %in% c(1L, 10L)]), 0L,
                     label = "All other records have one unit")
  })
})

context("mknapsack")
describe("mknapsack", {
  it("Generates vector of optimal containers for a given problem", {
    # Combine data provided at unit level to MOQ level
    units.combined <- group_moq(units)

    # Get vector of optimal containers
    containers <- mknapsack(units.combined$utility,
                         units.combined$volume,
                         units.combined$moq,
                         65)

    units.combined$container <- containers

    # Check first container
    # See optimal solution example for the first container in acceptance doc:
    # https://docs.google.com/spreadsheets/d/1W_dmJ5j0AOnT6Nea12gpksB7Mp5QrLNsh3q_LZJE8Rs
    expected.utility <- 553
    utility <- units.combined[container == 1, sum(utility)]
    expect_gte(utility, expected.utility)

    volume <- units.combined[container == 1, sum(volume)]
    expected.volume <- 65
    expect_lte(volume, expected.volume)

    # Check second container
    utility <- units.combined[container == 2, sum(utility)]
    volume <- units.combined[container == 2, sum(volume)]
    expect_true(volume >= 56)
    expect_lte(volume, expected.volume)
    expect_gte(utility, 95)
  })
  it("assigns one small volume item to a container", {

      profit <-  673
      volume <- 1.6
      units <- 33
      moq <- 1
      containers <- mknapsack(profit, volume, moq, 65)
      expect_equal(containers, 1)

  })
  it("with sold vector, sold items have highest priority", {
      # Combine data provided at unit level to MOQ level
      units.combined <- group_moq(units)

      # Get vector of optimal containers
      containers <- mknapsack(profit = units.combined$utility,
                                       volume = units.combined$volume,
                                       moq = units.combined$moq,
                                       cap = 65)
      expect_true(containers[4] == c(3) || is.na(containers[4]),
                  label = "here behaviour of CBC and LP_Solve are different")

      # Adding the sold
      units.combined[, sold := 0]
      units.combined[4, sold := 1]
      containers <- mknapsack(profit = units.combined$utility,
                                       volume = units.combined$volume,
                                       moq  = units.combined$moq,
                                       cap = 65,
                                       sold = units.combined$sold)
      expect_equal(containers[4], 1,
                   label = "Pre-sold item was moved to container one.")

  })
  it("assigns no container where volume of lines is over the cap", {
      profit = c(1207, 4268, 2055, 50)
      volume = c(115.2, 115.2, 31.7625, 61.7625)
      units = c(300L, 300L, 300L, 300L)
      moq = c(1L, 1L, 1L, 1L)

      containers <- mknapsack(profit, volume, moq, 65)
      expect_equal(containers, c(NA_integer_, NA_integer_, 1L, 2L))
  })
})

context("knapsask")
describe("knapsask.lpsolve", {
  it("solves knapsack problem using lpsolve", {
    skip_if_not_installed("lpSolve")
    library(lpSolve)
    profit = c(12, 40, 20, 1)
    volume = c(40, 10, 30, 60)
    units = c(5L, 1L, 30L, 20L)
    moq = c(1L, 1L, 1L, 1L)
    res <- knapsack.lpsolve(profit, volume, moq, 65)
    expected <- c(0L, 1L, 1L, 0L)
    expect_equal(res, expected,
                 label = "knapsack solution by lpsolve is correct")
  })
})

describe("knapsask.glpk", {
  it("solves knapsack problem using glpk", {
    skip_if_not_installed("Rglpk")
    skip_if_not_installed("ROI.plugin.glpk")
    skip_if_not_installed("ROI")
    library(Rglpk)
    library(ROI.plugin.glpk)
    library(ROI)
    profit = c(12, 40, 20, 1)
    volume = c(40, 10, 30, 60)
    units = c(5L, 1L, 30L, 20L)
    moq = c(1L, 1L, 1L, 1L)
    res <- knapsack.glpk(profit, volume, moq, 65)
    expected <- c(0L, 1L, 1L, 0L)
    expect_equal(res, expected,
                 label = "knapsack solution by cbc is correct")
  })
})

describe("solver", {
  it("calls correct method based on the option value", {
    solver <- getOption("mknapsack.solver")
    knapsack.glpk_mock <- mock()
    with_mock(
      `mknapsack::knapsack.glpk` = knapsack.glpk_mock,
      {
        options("mknapsack.solver" = "glpk")
        mknapsack(1, 1, 0)
        mockery::expect_called(knapsack.glpk_mock, 1)
      }
    )
    options(mknapsack.solver = solver)
  })
})

describe("at contains MOQ line or after", {
  it("combines data provided at unit level to MOQ level", {

       units.combined <- group_moq(units)
       l <- length(units.combined$moq)
       moq.constraint.matrix <- moq_constraint(units.combined$moq)
       expect <- matrix(c(1, -1, rep(0, l - 2),
                          1, 0, -1, rep(0, l - 3),
                          1, 0, 0, -1, rep(0, l - 4),
                          0, 0, 0, 0, 1, -1, rep(0, l - 6)),
                        nrow = 4, byrow = T)
       expect_equal(moq.constraint.matrix[1:4, ], expect)

  })
  it("returns zero matrix for non-moq problem", {
    moq <- c(0, 0, 0)
    moq.constraint.matrix <- moq_constraint(moq)
    expect_equal(nrow(moq.constraint.matrix), 0,
                 label = "Empty matrix returned if there are no MOQs")
  })
  it("returns empty constraint matrix if all items contain moq", {
    moq = c(1L, 1L, 1L, 1L)
    res <- moq_constraint(moq)
    expect_equal(nrow(res), 0, label = "MOQ constraint is empty.")
  })
})


test_that("item with MOQ is added first", {
  units.combined <- fread("moq-order-test.txt", header = T)
  moq <- units.combined$moq
  profit <- units.combined$utility
  volume <- units.combined$volume
  res <- mknapsack(profit, volume, moq, 65)
  units.combined$container <- res

  # Aggregate solution to container
  containers <- units.combined[, .(volume = sum(volume),
                                   utility = sum(utility)),
                               by = container]

  expect_lte(max(containers$volume), 65,
             label = "container volume does not exceed the limit")

  containers.order <- order(containers$container, na.last = TRUE)
  expected <- order(-containers$utility)
  expect_equal(containers.order, expected,
              label = "Container utility decreases for each new container")

  # Calculating the first container position for each moq/non-moq item
  moq.first <- tapply(res[moq == 1], units.combined$sku[moq == 1], min)
  moq.first <- data.table(sku = names(moq.first),
                          container.moq = moq.first)

  non.moq.first <- tapply(res[moq != 1], units.combined$sku[moq != 1], min)
  non.moq.first <- data.table(sku = names(non.moq.first),
                              container = non.moq.first)

  # Making sure that moq container is less or equal to any non-moq container
  dt.check <- merge(moq.first, non.moq.first, by = "sku")
  expect_equal(nrow(dt.check[container.moq > container]), 0L,
              label = "For products that have more than one line check that MOQ line is added prior to other lines")

})
