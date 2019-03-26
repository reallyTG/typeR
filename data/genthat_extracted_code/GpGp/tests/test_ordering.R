
context("Ordering Functions")

test_that("ordering functions give valid permutation in 2d", {
    
    n1 <- 20
    n2 <- 20
    n <- n1*n2
    locs <- as.matrix( expand.grid( 1:n1, 1:n2 ) )
    expect_equal( length(unique(order_maxmin(locs))), n )
    expect_equal( length(unique(order_dist_to_point(locs, colMeans(locs)))), n )
    expect_equal( length(unique(order_middleout(locs))), n )
    expect_equal( length(unique(order_coordinate(locs,1))), n )
    expect_equal( length(unique(order_coordinate(locs,c(1,2)))), n )

})

test_that("ordering functions give valid permutation in 3d", {
    
    n1 <- 8
    n2 <- 8
    n3 <- 8
    n <- n1*n2*n3
    locs <- as.matrix( expand.grid( 1:n1, 1:n2, 1:n3 ) )
    expect_equal( length(unique(order_maxmin(locs))), n )
    expect_equal( length(unique(order_dist_to_point(locs, colMeans(locs)))), n )
    expect_equal( length(unique(order_middleout(locs))), n )
    expect_equal( length(unique(order_coordinate(locs,2))), n )
    expect_equal( length(unique(order_coordinate(locs,c(1,2)))), n )
    expect_equal( length(unique(order_coordinate(locs,c(1,2,3)))), n )

})

test_that("ordering functions give valid permutation on sphere", {
    
    lat <- seq(-90,90,length.out = 22)[2:21]
    lon <- seq(0,360,length.out = 21)[1:20]
    locs <- as.matrix( expand.grid( lat, lon ) )
    n <- nrow(locs)
    expect_equal( length(unique(order_maxmin(locs))), n )
    expect_equal( length(unique(order_dist_to_point(locs, colMeans(locs)))), n )
    expect_equal( length(unique(order_middleout(locs))), n )
    expect_equal( length(unique(order_coordinate(locs,1))), n )
    expect_equal( length(unique(order_coordinate(locs,c(1,2)))), n )

})


