context("misc")

test_that("Fitted values", {
  # Published examples of NIPALS with missing values are 
  # extremely rare.  Here is an example of estimating the missing values
  # using XLSTAT (details on methodology are limited)
  # https://help.xlstat.com/customer/en/portal/articles/2062415-missing-data-imputation-using-nipals-in-excel?b_id=9283
  auto <- data.frame(make = c("Honda civic", "Renault 19", "Fiat Tipo",
                              "Peugeot 405", "Renault 21", "Citroen BX"),
                     capacity = c(1396, 1721, 1580, 1769, 2068, 1769L),
                     power = c(90, 92, 83, 90, 88, 90L),
                     speed = c(174, 180, 170, 180, 180, 182L),
                     weight = c(850, 965, 970, 1080, 1135, 1060L),
                     length = c(369, 415, 395, 440, 446, 424L),
                     width = c(166, 169, 170, 169, 170, 168L))
  # create missing values along the diagonal
  auto[1,2] <- auto[2,3] <- auto[3,4] <- auto[4,5] <- auto[5,6] <- auto[6,7] <- NA

  library(nipals)
  # These settings give results similar to XLstat 
  m1 <- nipals(auto[,-1], fitted=TRUE, gramschmidt=FALSE, tol=1e-11, verbose=TRUE)
  expect_equal(diag(m1$fitted),
            c(1365.236, 88.600, 175.798, 1051.698, 432.470, 168.554), # xlstat
            tol=1e-5)
})

test_that("Code coverage of function arguments", {
  B <- matrix(c(50, 67, 90, 98, 120,
                55, 71, 93, 102, 129,
                65, 76, 95, 105, 134,
                50, 80, 102, 130, 138,
                60, 82, 97, 135, 151,
                65, 89, 106, 137, 153,
                75, 95, 117, 133, 155), ncol=5, byrow=TRUE)
  rownames(B) <- c("G1","G2","G3","G4","G5","G6","G7")
  colnames(B) <- c("E1","E2","E3","E4","E5")
  
  library(nipals)
  Bnarow = B
  Bnarow[1,] = NA
  expect_error(nipals(Bnarow))
  Bnacol = B
  Bnacol[,1] = NA
  expect_error(nipals(Bnacol))
  
  B2 = B
  B2[1,1] = B2[2,1] = NA
  
  # ncomp
  m1 = nipals(B2, ncomp=1)
  
  # center/scale
  m1 = nipals(B2, center=FALSE, scale=FALSE)
  m1 = nipals(B2, center=TRUE, scale=FALSE)
  m1 = nipals(B2, center=TRUE, scale=TRUE)
  
  # maxiter
  expect_warning(nipals(B, maxiter=2))

  # tol
  m1 = nipals(B2, tol=1e-1, verbose=TRUE)
  m1 = nipals(B2, tol=1e-10, verbose=TRUE)

  # startcol
  m1 = nipals(B, startcol=0, verbose=TRUE)
  m1 = nipals(B, startcol=5, verbose=TRUE)

  # fitted
  expect_null(nipals(B)$fitted)
  expect_null(nipals(B, fitted=FALSE)$fitted)
  expect_false(is.null(nipals(B, fitted=TRUE)$fitted))

  # force.na
  m1 = nipals(B, force.na=FALSE)
  m1 = nipals(B, force.na=TRUE)
  
  # gramschmidt
  m1 = nipals(B2, gramschmidt=FALSE) # default
  round(crossprod(m1$loadings), 3)  # 1 on diagonal, but not identity
  m2 = nipals(B2, gramschmidt=TRUE)
  round(crossprod(m2$loadings), 3)  # should be identity 5x5
  
  # verbose
  m1 = nipals(B, verbose=TRUE)
  
})

test_that("start column function", {
  # corn silage data from C.Majer
  corn <- structure(c(20.73, 23.58, 22.41, 19.97, 21.42, 24.48, 23.19, 25.73,
                      22.66, 23.93, 18.79, 18.56, 18.47, 18.33, 20.01, 19.03, 
                      19.36, 21.2, 19.17, 18.17, 20.41, 17.67, 17.89, 21.41,
                      18.81, 22.77, NA, 19.86, 19.43, NA, 17.28, 14.9, 16.52,
                      14.77, 19.35, 22.46, 24.61, NA, NA, 26.16, NA, 19.48,
                      NA, 20.72, 17.8, 18.55, 19.56, 20.01, 20.05, 17.18,
                      16.29, 17.41, 15.86, 15.7, 17.84, 24.1, 27.02, 26.76,
                      26, 26.02, 20.63, 20.37, 21.17, 21.55, 19.12),
                    .Dim = c(5L, 13L),
                    .Dimnames = list(c("G1", "G2", "G3", "G4", "G5"),
                                     c("E01", "E02", "E03", "E04", "E05",
                                       "E06", "E07", "E08", "E09", "E10",
                                       "E11", "E12", "E13")))
  expect_warning( nipals(corn, startcol=function(x) var(x, na.rm=TRUE)) )
  expect_silent( nipals(corn, startcol=function(x) sum(abs(x), na.rm=TRUE)) )
  
})

