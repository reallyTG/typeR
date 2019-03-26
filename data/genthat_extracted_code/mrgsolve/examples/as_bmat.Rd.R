library(mrgsolve)


### Name: as_bmat
### Title: Coerce R objects to block or diagonal matrices
### Aliases: as_bmat as_bmat,list-method as_bmat,numeric-method
###   as_bmat,data.frame-method as_bmat,ANY-method as_dmat
###   as_dmat,list-method as_dmat,ANY-method as_dmat,numeric-method
###   as_dmat,data.frame-method

### ** Examples


df <- data.frame(OMEGA1.1 = c(1,2),
                 OMEGA2.1 = c(11,22),
                 OMEGA2.2 = c(3,4),
                 SIGMA1.1 = 1,
                 FOO=-1)

as_bmat(df, "OMEGA")
as_dmat(df,"SIGMA")
as_dmat(df[1,],"OMEGA")




