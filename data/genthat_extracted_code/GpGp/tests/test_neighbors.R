
context("Nearest Neighbor Functions")

test_that("neighbor array has appropriate structure in 2d", {
    
    n1 <- 15
    n2 <- 15
    n <- n1*n2
    locs <- as.matrix( expand.grid( 1:n1, 1:n2 ) )
    ord <- order_maxmin(locs)
    locsord <- locs[ord,]
    m <- 20
    NNarray <- find_ordered_nn(locsord,m=m)
    fun_geq <- function(inds) sum( inds[2:length(inds)] >= inds[1], na.rm = TRUE )

    expect_equal( dim(NNarray), c(n,m+1) )
    expect_equal( NNarray[,1], 1:n )
    expect_equal( sum(apply( NNarray, 1, fun_geq )), 0 )

})

test_that("neighbor array has appropriate structure on sphere", {

    n1 <- 15
    n2 <- 15
    lat <- seq(-90,90,length.out = n1+2)[2:(n1+1)]
    lon <- seq(0,360,length.out = n1+1)[2:n1]
    locs <- as.matrix( expand.grid( lat, lon ) )
    n <- nrow(locs)
    ord <- order_maxmin(locs, lonlat = TRUE)
    locsord <- locs[ord,]
    m <- 20
    NNarray <- find_ordered_nn(locsord,m=m, lonlat = TRUE)
    fun_geq <- function(inds) sum( inds[2:length(inds)] >= inds[1], na.rm = TRUE )

    expect_equal( dim(NNarray), c(n,m+1) )
    expect_equal( NNarray[,1], 1:n )
    expect_equal( sum(apply( NNarray, 1, fun_geq )), 0 )

})


test_that("neighbor array has appropriate structure on sphere-time", {

    n1 <- 15
    n2 <- 15
    lat <- seq(-90,90,length.out = n1+2)[2:(n1+1)]
    lon <- seq(0,360,length.out = n1+1)[2:n1]
    locs <- as.matrix( expand.grid( lat, lon ) )
    n <- nrow(locs)
    locstime <- cbind(locs,1:n)
    ord <- order_maxmin(locstime, lonlat = TRUE)
    locsord <- locstime[ord,]
    m <- 20
    NNarray <- find_ordered_nn(locsord,m=m, lonlat = TRUE)
    fun_geq <- function(inds) sum( inds[2:length(inds)] >= inds[1], na.rm = TRUE )

    expect_equal( dim(NNarray), c(n,m+1) )
    expect_equal( NNarray[,1], 1:n )
    expect_equal( sum(apply( NNarray, 1, fun_geq )), 0 )

})


test_that("neighbor list has appropriate structure in 2d", {
    
    n1 <- 15
    n2 <- 15
    n <- n1*n2
    locs <- as.matrix( expand.grid( 1:n1, 1:n2 ) )
    ord <- order_maxmin(locs)
    locsord <- locs[ord,]
    m <- 20
    NNarray <- find_ordered_nn(locsord,m=m)
    NNlist <- group_obs(NNarray)
    
    expect_equal( sum( diff( NNlist[["last_ind_of_block"]] ) <= 0 ), 0 ) 
    expect_equal( sum( diff( NNlist[["last_resp_of_block"]] ) <= 0 ), 0 ) 
    expect_equal( length(NNlist[["local_resp_inds"]] ) , n ) 
    expect_equal( length(NNlist[["global_resp_inds"]] ) , n ) 
    
})    
    
    
test_that("neighbor list has appropriate structure on sphere", {

    n1 <- 15
    n2 <- 15
    lat <- seq(-90,90,length.out = n1+2)[2:(n1+1)]
    lon <- seq(0,360,length.out = n1+1)[2:n1]
    locs <- as.matrix( expand.grid( lat, lon ) )
    n <- nrow(locs)
    ord <- order_maxmin(locs, lonlat = TRUE)
    locsord <- locs[ord,]
    m <- 20
    NNarray <- find_ordered_nn(locsord,m=m, lonlat = TRUE)
    NNlist <- group_obs(NNarray)

    expect_equal( sum( diff( NNlist[["last_ind_of_block"]] ) <= 0 ), 0 ) 
    expect_equal( sum( diff( NNlist[["last_resp_of_block"]] ) <= 0 ), 0 ) 
    expect_equal( length(NNlist[["local_resp_inds"]] ) , n ) 
    expect_equal( length(NNlist[["global_resp_inds"]] ) , n ) 

})
    

test_that("neighbor list has appropriate structure on sphere-time", {

    n1 <- 15
    n2 <- 15
    lat <- seq(-90,90,length.out = n1+2)[2:(n1+1)]
    lon <- seq(0,360,length.out = n1+1)[2:n1]
    locs <- as.matrix( expand.grid( lat, lon ) )
    n <- nrow(locs)
    locstime <- cbind(locs,1:n)
    ord <- order_maxmin(locstime, lonlat = TRUE)
    locsord <- locstime[ord,]
    m <- 20
    NNarray <- find_ordered_nn(locsord,m=m, lonlat = TRUE)
    NNlist <- group_obs(NNarray)

    expect_equal( sum( diff( NNlist[["last_ind_of_block"]] ) <= 0 ), 0 ) 
    expect_equal( sum( diff( NNlist[["last_resp_of_block"]] ) <= 0 ), 0 ) 
    expect_equal( length(NNlist[["local_resp_inds"]] ) , n ) 
    expect_equal( length(NNlist[["global_resp_inds"]] ) , n ) 

})
