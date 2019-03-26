test_that("gameState gets created correctly", {
  x <- startGame()
  expect_equal(x$isDone,FALSE)
  expect_equal(x$winner,"_")
  expect_equal(x$numMoves,0)
  expect_equal(length(x$board),9)
  expect_equal(unique(x$board),"_")
  expect_equal(length(x$moves),9)
  expect_equal(unique(x$moves),0)
  expect_equal(length(x$movesP),9)
  expect_equal(unique(x$movesP),"_")
  expect_equal(x$currentPlayer %in% c("X","O"),TRUE)
  expect_equal(x$startingPlayer, x$currentPlayer)
})

test_that("currentPlayer gets assigned randomly to X and O", {
  r <- sapply(c(1:1000),function(i) {
    return(startGame()$currentPlayer)
  })
  nx <- sum(r == "X")
  no <- sum(r == "O")
  expect_equal(nx+no,1000)

  bt <- binom.test(c(nx,no),conf.level=.99)
  expect_equivalent(bt$conf[1] < bt$estimate,TRUE)
  expect_equivalent(bt$conf[2] > bt$estimate,TRUE)
})


