context("triangulate")

tri.area<- function(P, Pt) {
  A <- P[Pt[,1],]
  B <- P[Pt[,2],]
  C <- P[Pt[,3],]
  AB <- cbind(B - A, 0)
  BC <- cbind(C - B, 0)
  return(0.5*abs(geometry::extprod3d(AB, BC)[,3]))
}


test_that("triangulate can trianglulate a square", {
  p <- pslg(P=rbind(c(0, 0), c(0, 1), c(1, 1), c(1, 0)))
  tp <- triangulate(p)
  areas <- tri.area(tp$P, tp$T)
  expect_equal(areas, c(0.5, 0.5))

  tp <- triangulate(p, a=0.01)
  areas <- tri.area(tp$P, tp$T)
  expect_true(max(areas) < 0.01)
  expect_equal(sum(areas), 1)
})

test_that("triangulate can trianglulate an object with a concavity subject to a minimum area constraint", {
  ## Create an object with a concavity
  p <- pslg(P=rbind(c(0, 0), c(0, 1), c(0.5, 0.5), c(1, 1), c(1, 0)),
            S=rbind(c(1, 2), c(2, 3), c(3, 4), c(4, 5), c(5, 1)))
  ## Triangulate it subject to minimum area constraint
  tp <- triangulate(p, a=0.01)
  areas <- tri.area(tp$P, tp$T)
  expect_true(max(areas) < 0.01)
  expect_equal(sum(areas), 0.75)
})

test_that("If the input matrix contains NAs, triangulate should return an error", {
  ps <- matrix(rnorm(999), ncol=2)
  ps <- rbind(ps, NA)
  expect_error(triangulate(ps))
})

test_that("If there are not enough points to construct a simplex, an error is thrown", {         
  expect_error(triangulate(diag(2)))
})

test_that("Small values (1e-7 and below) of a do not lead to an error", {
  # Use a small triangle to make the computational effort bearable
  p <- pslg(P=rbind(c(0,0),c(1e-5,0),c(0,1e-5)))

  tp <- triangulate(p,a=1e-7)
  tp <- triangulate(p,a=1e-8)
  tp <- triangulate(p,a=1e-9)
})

test_that("triangulate can triangulate a hole", {
   p<-pslg(rbind(c(2, 2), c(2, -2), c(-2, -2), c(-2, 2),
                 c(1, 1), c(1, -1), c(-1, -1), c(-1, 1)),
           S=rbind(c(1, 2), c(2, 3), c(3, 4), c(4, 1),
                   c(5, 6), c(6, 7), c(7, 8), c(8, 5)),
           H=rbind(c(0, 0)))
   pt <- triangulate(p)

   ## There should be no diagonals across the hole
   expect_true(all(!apply(pt$T, 1, function(x) {all(is.element(c(5, 7),x ))})))
   expect_true(all(!apply(pt$T, 1, function(x) {all(is.element(c(6, 8),x ))})))
})

test_that("triangulate can triangulate two holes", {
   p<-pslg(rbind(c( 4,  4), c( 4, -4), c(-4, -4), c(-4,  4),
                 c( 3,  3), c( 3,  1), c( 1,  1), c( 1,  3),
                 c(-3, -3), c(-3, -1), c(-1, -1), c(-1, -3)),
           S=rbind(c(1, 2), c(2, 3), c(3, 4), c(4, 1),
                   c(5, 6), c(6, 7), c(7, 8), c(8, 5),
                   c(9, 10), c(10, 11), c(11, 12), c(12, 9)),
           H=rbind(c(2, 2), c(-2, -2)))
   pt <- triangulate(p)

   ## There should be no diagonals across the holes
   expect_true(all(!apply(pt$T, 1, function(x) {all(is.element(c(5, 7),x ))})))
   expect_true(all(!apply(pt$T, 1, function(x) {all(is.element(c(6, 8),x ))})))
   expect_true(all(!apply(pt$T, 1, function(x) {all(is.element(c(9, 11),x ))})))
   expect_true(all(!apply(pt$T, 1, function(x) {all(is.element(c(10, 12),x ))})))
})

test_that("triangulate can triangulate an example that has crashed on Win i386", {
  load(file.path(system.file(package = "RTriangle"), "extdata", "win-i386-crash.Rdata"))
  pt <- triangulate(p, Y=TRUE, j=TRUE, Q=TRUE)
})